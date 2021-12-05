import math
from typing import Union

from django.contrib.auth.models import User
from django.db import models

from bank_structure.costants import TransactionStatus, QuestionState, DATE__FORMAT
from bank_structure.utils import generate_random_card_number, generate_cvv_2


class Client(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        verbose_name="Client",
    )

    def __str__(self):
        return self.user.username


class Admin(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        verbose_name="Client",
    )

    def __str__(self):
        return self.user.username


class CreditCard(models.Model):
    number = models.CharField(
        max_length=16,
        default=generate_random_card_number(),

    )
    cvv2 = models.PositiveSmallIntegerField(
        default=generate_cvv_2()
    )
    owner = models.ForeignKey(
        Client,
        on_delete=models.CASCADE,
    )
    expiration_date = models.DateTimeField(
        blank=True,
        verbose_name='Card date and time',
    )
    balance = models.BigIntegerField(
        verbose_name='Card Balance',
    )

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

    def show_balance(self) -> Union[float, str]:
        return self.convert_money_to_str()

    def __str__(self):
        return self.hide_number()


class Transaction(models.Model):
    sender = models.ForeignKey(
        Client,
        on_delete=models.CASCADE,
        verbose_name="Money Sender",
    )
    receiver = models.ForeignKey(
        CreditCard,
        on_delete=models.CASCADE,
        verbose_name="Money Receiver",
    )
    value = models.BigIntegerField(
        default=0,
        verbose_name='Transaction money value',
    )
    status = models.CharField(
        default=TransactionStatus.UNKNOWN_ERROR,
        max_length=15,
        verbose_name='Transaction status'
    )
    date = models.DateField(
        auto_now_add=True,
        blank=True,
        verbose_name='Transaction date and time',
    )


class Question(models.Model):
    question = models.TextField(
        verbose_name="Client Issue text",
        blank=True,
    )
    answer = models.TextField(
        verbose_name="Admin Answer text",
        blank=True,
    )
    state = models.CharField(
        default=QuestionState.NOT_SOLVED,
        max_length=15,
        verbose_name='Transaction status'
    )
    author = models.ForeignKey(
        Client,
        on_delete=models.CASCADE,
        verbose_name="Question Author",
    )
    receiver = models.ForeignKey(
        Admin,
        on_delete=models.CASCADE,
        verbose_name="Who answered question",
    )
    date = models.DateTimeField(
        auto_now_add=True,
        blank=True,
        verbose_name='Question date and time',
    )

    def stringed_date(self) -> str:
        return self.date.strftime(DATE__FORMAT)

    def update_state(self, state: QuestionState, admin: Client):
        self.state = state
        self.changed_by = admin

    def update_answer(self, answer: str, admin: Client):
        self.answer = answer
        self.changed_by = admin

    def print_question(self):
        print(f'\nВопрос: {self.question}'
              f'\nОтвет: {self.answer}'
              f'\nСтатус: {self.state}'              
              f'\nАвтор: {self.author}'
              f'\nОтветил: {self.receiver}'
              f'\nДата: {self.stringed_date()}'
              )
