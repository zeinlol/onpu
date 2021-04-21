week = {
    1: 'Monday',
    2: 'Thursday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
}

while True:
    print('Enter number of week day')
    try:
        number = int(input())
        print('This day is %s.' % week[number])
    except:
        print('Enter correct number! (1-7)')
