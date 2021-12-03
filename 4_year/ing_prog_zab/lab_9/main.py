from core.data.input_hints import get_command, get_user, get_correct_user, get_value, choose_user
from core.tech_support import ask_question
from core.tech_support.engine import show_users_questions
from core.tech_support.show_questions import show_user_questions
from core.utils.generators.convert_types import convert_money
from main_classes.cards import CreditCard
from main_classes.transactions import Transaction
from main_classes.users import Client, Administrator

first_client = Client(
    first_name='Nick',
    last_name='Borshchov',
    phone_number='066 330 7571'
)
first_client.add_new_card(CreditCard(owner=first_client, balance=5000.65))
second_client = Client(
    first_name='Elon',
    last_name='Musk',
    phone_number='034 354 7657'
)
second_client.add_new_card(CreditCard(owner=second_client, balance=53243242000.65))
transactions = []


admin = Administrator(
    first_name='Sky',
    last_name='Net',
    phone_number='000 000 0000'
)


def show_users_data():
    first_client.print_whole_info()
    print('-' * 40)
    second_client.print_whole_info()


def show_transactions():
    for transaction in transactions:
        print('-' * 40)
        print(transaction)
        print('-' * 40)


def admin_singed() -> bool:
    login = input('Введите логин: ')
    password = input('Введите пароль: ')
    return admin.is_singed(login=login, password=password)


show_users_data()
while True:
    command = int(input(get_command))
    if command == 1:
        destination = int(input(f'{get_user} (1 - Nick Borshchov, 2 - Elon Musk): '))
        while destination not in [1, 2]:
            destination = int(input(f'{get_correct_user} (1 - Nick Borshchov, 2 - Elon Musk): '))
        value = 0
        while value <= 0:
            value = convert_money(input(get_value))
        if destination == 1:
            sender = second_client
            receiver = first_client
        else:
            sender = first_client
            receiver = second_client
        new_transaction = Transaction(sender=sender, receiver=receiver, value=value)
        new_transaction.send_money()
        transactions.append(new_transaction)
        print(new_transaction)

    elif command == 2:
        destination = 0
        while destination not in [1, 2]:
            destination = int(input(f'{choose_user} (1 - Nick Borshchov, 2 - Elon Musk): '))
        show_user_questions(first_client if destination == 1 else second_client)

    elif command == 3:
        destination = 0
        while destination not in [1, 2]:
            destination = int(input(f'{choose_user} (1 - Nick Borshchov, 2 - Elon Musk): '))
        ask_question(first_client if destination == 1 else second_client)

    elif command == 4 and admin_singed():
        show_users_data()

    elif command == 5 and admin_singed():
        show_users_questions(admin=admin)

    elif command == 6 and admin_singed():
        show_transactions()
