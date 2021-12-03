import math
from typing import Union


def convert_float_to_int(value: float) -> int:
    return math.ceil(value * 100)


def convert_int_to_float(value: int) -> float:
    return round(value / 100, 2)


def convert_money(value: Union[int, float, str]) -> int:
    if type(value) is str:
        try:
            return int(value) * 100
        except ValueError:
            try:
                return convert_float_to_int(float(value))
            except ValueError:
                print('Неправильное значение!')
                return 0

