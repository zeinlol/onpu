while True:
    print('Enter value')
    num = input()
    try:
        num = int(num)
        if num < 0:
            print('Your num is under zero')
        elif num > 0:
            print('Your num is above zero')
        else:
            print('Your num is zero')
    except ValueError:
        print('Enter only 1 integer number!')
