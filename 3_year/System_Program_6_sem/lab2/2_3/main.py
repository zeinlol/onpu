while True:
    print("Enter numbers. Like '45 432 65' ")
    try:
        num = input()
        numbers = num.split(' ')
        for i in range(0, len(numbers)):
            numbers[i] = int(numbers[i])
        numbers.sort()
        print('Done array: ' + str(numbers))
    except ValueError:
        print('Enter only numbers!')
