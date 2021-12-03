from abc import ABC
from datetime import datetime

from core.data.setup import QuestionState, DATE__FORMAT
from core.utils.typing import T_CLIENT, T_ADMIN


class Question(ABC):
    def __init__(self, question: str, client: T_CLIENT):
        self.question = question
        self.answer = ''
        self.state = QuestionState.NOT_SOLVED
        self.author = client
        self.date = datetime.now()
        self.changed_by = None

    def stringed_date(self) -> str:
        return self.date.strftime(DATE__FORMAT)

    def update_state(self, state: QuestionState, admin: T_ADMIN):
        self.state = state
        self.changed_by = admin

    def update_answer(self, answer: str, admin: T_ADMIN):
        self.answer = answer
        self.changed_by = admin

    def print_question(self):
        print(f'\nВопрос: {self.question}'
              f'\nОтвет: {self.answer}'
              f'\nСтатус: {self.state}'              
              f'\nАвтор: {self.author}'
              f'\nОтветил: {self.changed_by}'
              f'\nДата: {self.stringed_date()}'
              )
