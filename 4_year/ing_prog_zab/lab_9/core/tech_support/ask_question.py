from core.data.input_hints import get_question
from core.tech_support.questions_db import users_questions
from core.utils.typing import T_CLIENT
from main_classes.questions import Question


def ask_question(client: T_CLIENT):
    question_text = input(get_question)
    question = Question(client=client, question=question_text)
    users_questions.append(question)
    client.questions.append(question)
