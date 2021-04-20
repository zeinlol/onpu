import datetime


def check_input(date):
    try:
        out = datetime.datetime.strptime(date, '%d %m')
        print(out)
        return True
    except:
        pass
    return False


def convert_date(date):
    out_date = date.split(' ')
    for i in range(0, len(out_date)):
        out_date[i] = int(out_date[i])
    return out_date


def find_zodiac(date):
    astro_sign = 'unknown error'
    if date[1] == 12:
        astro_sign = 'Sagittarius' if (date[0] < 22) else 'Capricorn'
    elif date[1] == 1:
        astro_sign = 'Capricorn' if (date[0] < 20) else 'Aquarius'
    elif date[1] == 2:
        astro_sign = 'Aquarius' if (date[0] < 19) else 'Pisces'
    elif date[1] == 3:
        astro_sign = 'Pisces' if (date[0] < 21) else 'Aries'
    elif date[1] == 4:
        astro_sign = 'Aries' if (date[0] < 20) else 'Taurus'
    elif date[1] == 5:
        astro_sign = 'Taurus' if (date[0] < 21) else 'Gemini'
    elif date[1] == 6:
        astro_sign = 'Gemini' if (date[0] < 21) else 'Cancer'
    elif date[1] == 7:
        astro_sign = 'Cancer' if (date[0] < 23) else 'Leo'
    elif date[1] == 8:
        astro_sign = 'Leo' if (date[0] < 23) else 'Virgo'
    elif date[1] == 9:
        astro_sign = 'Virgo' if (date[0] < 23) else 'libra'
    elif date[1] == 10:
        astro_sign = 'Libra' if (date[0] < 23) else 'Scorpio'
    elif date[1] == 11:
        astro_sign = 'Scorpio' if (date[0] < 22) else 'Sagittarius'
    return astro_sign


while True:
    print('Enter your birthday date ( DD:MM example: 15 01)')
    birth_date = input()
    if check_input(birth_date):
        date_nums = convert_date(birth_date)
        zodiac = find_zodiac(date_nums)
        print(date_nums)
        print('Your zodiac sign is %s.' % zodiac)
    else:
        print('Enter correct date!')
