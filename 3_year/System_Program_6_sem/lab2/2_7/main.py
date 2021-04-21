while True:
    print('Enter value')
    num = input()
    try:
        num = int(num)
        if num < 10:
            result = num + 5
        elif 10 <= num < 15:
            result = num ** 2
        elif num >= 15:
            result = 2 * num + 7
        print('Result: ' + str(result))
    except ValueError:
        print('Enter only 1 integer number!')
    except MemoryError:
        print('Arguments are too large!')
    except Exception as e:
        print('Error! %s' % str(e))
