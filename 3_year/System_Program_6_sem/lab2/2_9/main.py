import config

from config import second_formula

while True:
    print('Enter value')
    num = input()
    try:
        num = int(num)
        if num < 10:
            result = config.first_formula(num)
        elif 10 <= num < 15:
            result = second_formula(num)
        elif num >= 15:
            result = config.third_formula(num)
        print('Result: ' + str(result))
    except ValueError:
        print('Enter only 1 integer number!')
    except MemoryError:
        print('Arguments are too large!')
    except Exception as e:
        print('Error! %s' % str(e))
