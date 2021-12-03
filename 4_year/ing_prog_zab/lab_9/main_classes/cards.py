import math
from abc import ABC
from typing import Union

from core.utils.generators.card_number import generate_random_card_number, generate_cvv_2
from core.utils.typing import T_CLIENT


class CreditCard(ABC):

    def __init__(self, owner: T_CLIENT, balance: float):
        self.number = generate_random_card_number()
        self.cvv2 = generate_cvv_2()
        self.owner = owner
        self.expiration_date = '10.10'
        self.balance = self.convert_float_to_int(balance)

    def convert_float_to_int(self, value: float = None) -> int:
        if not value:
            value = self.balance
        return math.ceil(value * 100)

    def convert_money_to_float(self) -> float:
        return self.balance / 100

    def convert_money_to_str(self) -> str:
        return str(self.convert_money_to_float())

    def hide_number(self) -> str:
        return self.number[:4] + '*' * 8 + self.number[-4:]

    def show_balance(self)-> Union[float, str]:
        return self.convert_money_to_str()

    def __str__(self):
        return self.hide_number()
