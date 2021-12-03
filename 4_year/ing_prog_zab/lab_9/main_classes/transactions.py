from abc import ABC
from datetime import datetime

from core.data.input_hints import enter_pass
from core.data.setup import MAX_WRONG_PASS_ATTEMPTS, DATE__FORMAT, TransactionStatus
from core.utils.generators.convert_types import convert_int_to_float
from core.utils.typing import T_CLIENT


class Transaction(ABC):
    def __init__(self, sender: T_CLIENT, receiver: T_CLIENT, value: int):
        self.sender = sender
        self.receiver = receiver
        self.value = value
        self.status = TransactionStatus.UNKNOWN_ERROR
        self.date = datetime.now()

    def get_transaction_date(self) -> str:
        return self.date.strftime(DATE__FORMAT)

    def show_value(self) -> float:
        return convert_int_to_float(self.value)

    def check_sender_pass(self) -> bool:
        attempts = 0
        while attempts <= MAX_WRONG_PASS_ATTEMPTS:
            if not self.sender.check_password(input(f'{enter_pass} ({3 - attempts}): ')):
                attempts += 1
            else:
                return True
        self.status = TransactionStatus.AUTHORIZATION_ERROR
        return False

    def check_sender_balance(self, value):
        is_have_money = self.sender.have_enough_money(value=self.value)
        if not is_have_money:
            self.status = TransactionStatus.NO_MONEY
        return is_have_money

    def send_money(self):
        if self.check_sender_pass() and self.check_sender_balance(
            value=self.value
        ):
            self.status = TransactionStatus.SUCCESS
            self.sender.increase_money(value=self.value)
            self.receiver.decrease_money(value=self.value)

    def __str__(self):
        return f'\nОтправитель: {self.sender}' \
               f'\nПолучатель: {self.receiver}' \
               f'\nСумма: {self.show_value()} грн' \
               f'\nСтатус: {self.status}' \
               f'\nВремя операции: {self.get_transaction_date()}'
