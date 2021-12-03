DATE__FORMAT = "%m/%d/%Y, %H:%M:%S"
VISA__PREFIXES = [
    ['4', '5', '3', '9'],
    ['4', '5', '5', '6'],
    ['4', '9', '1', '6'],
    ['4', '5', '3', '2'],
    ['4', '9', '2', '9'],
    ['4', '0', '2', '4', '0', '0', '7', '1'],
    ['4', '4', '8', '6'],
    ['4', '7', '1', '6'],
    ['4']]

MASTERCARD__PREFIXES = [
    ['5', '1'], ['5', '2'], ['5', '3'], ['5', '4'], ['5', '5']]
AMEX_PREFIXES = [['3', '4'], ['3', '7']]
DISCOVERED__PREFIXES = [['6', '0', '1', '1']]
DINNERS__PREFIXES = [
    ['3', '0', '0'],
    ['3', '0', '1'],
    ['3', '0', '2'],
    ['3', '0', '3'],
    ['3', '6'],
    ['3', '8']]
EN_ROUTE__PREFIXES = [['2', '0', '1', '4'], ['2', '1', '4', '9']]
JCB__PREFIXES = [['3', '5']]
VOYAGER__PREFIXES = [['8', '6', '9', '9']]


class TransactionStatus:
    SUCCESS = 'Успешно'
    UNKNOWN_ERROR = 'Неизвестная ошибка'
    NO_MONEY = 'Недостаточно средств'
    AUTHORIZATION_ERROR = 'Ошибка авторизации пользователя'


class QuestionState:
    SOLVED = 'solved'
    NOT_SOLVED = 'not_solved'
