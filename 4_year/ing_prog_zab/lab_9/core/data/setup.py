MAX_WRONG_PASS_ATTEMPTS = 3
DATE__FORMAT = "%m/%d/%Y, %H:%M:%S"
ADMIN__PASSWORD = 'admin'
ADMIN__LOGIN = 'admin'


class TransactionStatus:
    SUCCESS = 'Успешно'
    UNKNOWN_ERROR = 'Неизвестная ошибка'
    NO_MONEY = 'Недостаточно средств'
    AUTHORIZATION_ERROR = 'Ошибка авторизации пользователя'


class PersonStatus:
    ADMIN = 'admin'
    USER = 'user'


class QuestionState:
    SOLVED = 'solved'
    NOT_SOLVED = 'not_solved'
