from core.data.setup import ADMIN__PASSWORD, PersonStatus, ADMIN__LOGIN
from core.utils.typing import T_CARD


class Person:

    def __init__(self, first_name: str, last_name: str, phone_number: str):
        self.first_name = first_name
        self.last_name = last_name
        self.phone_number = phone_number
        self.login = str((first_name + last_name)).lower()
        self.password = str(first_name).upper()
        self.status = PersonStatus.USER

    def check_password(self, value: str) -> bool:
        return self.password == value

    def is_singed(self, login: str, password: str) -> bool:
        if self.login != login or self.password != password:
            print('Неверный логин или пароль')
            return False
        return (self.login == login) and (self.password == password)


class Client(Person):

    def __init__(self, first_name: str, last_name: str, phone_number: str):
        self.cards = []
        self.questions = []
        super().__init__(first_name, last_name, phone_number)

    def add_new_card(self, card: T_CARD) -> None:
        self.cards.append(card)

    def print_cards_info(self) -> str:
        # for card in self.cards:
        return ''.join((f'\n\tНомер: {card.number}'
                        f'\n\tCvv2: {card.cvv2}'
                        f'\n\tБаланс: {card.show_balance()} грн'
                        f'\n\tДействительна до: {card.expiration_date}'
                        ) for card in self.cards)

    def have_enough_money(self, value: int) -> bool:
        return self.cards[0].balance >= value

    def decrease_money(self, value: int) -> None:
        self.cards[0].balance += value

    def increase_money(self, value: int) -> None:
        self.cards[0].balance -= value

    def __str__(self):
        return f'{self.first_name} {self.last_name}. Карта: {self.cards[0]}'

    def print_whole_info(self):
        print(f'Имя: {self.first_name}'
              f'\nФамилия: {self.last_name}'
              f'\nНомер телефона: {self.phone_number}'
              f'\nЛогин: {self.login}'
              f'\nПароль: {self.password}'
              f'\nИнформация о картах: {self.print_cards_info()}')

    def print_questions(self):
        for question in self.questions:
            question.print_question()


class Administrator(Person):
    def __init__(self, first_name: str, last_name: str, phone_number: str):
        super().__init__(first_name, last_name, phone_number)
        self.login = ADMIN__LOGIN
        self.password = ADMIN__PASSWORD
        self.status = PersonStatus.ADMIN

    def __str__(self):
        return f'Администратор {self.first_name} {self.last_name}'
