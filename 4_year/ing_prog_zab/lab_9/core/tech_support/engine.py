from core.data.input_hints import question_answer_choices, question_admin_answer
from core.data.setup import QuestionState
from core.tech_support.questions_db import users_questions
from core.utils.typing import T_ADMIN


def show_users_questions(admin: T_ADMIN):
    for question in users_questions:
        print(f"{'-' * 40}\n{question.print_question()}{'-' * 40}")
        action = int(input(question_answer_choices))
        if action == 1:
            question.update_state(state=QuestionState.SOLVED, admin=admin)
        elif action == 2:
            question.update_answer(input(question_admin_answer), admin=admin)
        else:
            return
