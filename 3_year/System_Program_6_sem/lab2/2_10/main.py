

while True:
    try:
        print('a•x²+b•x+c=0')
        a = input('Enter a: ')
        b = input('Enter b: ')
        c = input('Enter c: ')
        try:
            a = float(a)
            b = float(b)
            c = float(c)
        except:
            raise ValueError
        discriminant = b ** 2 - 4 * a * c
        print('D = ' + str(discriminant))
        if discriminant < 0:
            print('No roots')
        elif discriminant == 0:
            x = -b / (2 * a)
            print('x = ' + str(x))
        else:
            x1 = (-b + discriminant ** 0.5) / (2 * a)
            x2 = (-b - discriminant ** 0.5) / (2 * a)
            print('x₁ = ' + str(round(x1, 3)))
            print('x₂ = ' + str(round(x2, 3)))
    except ValueError:
        print('Enter only numbers!')
    except MemoryError:
        print('Arguments are too large!')
    except Exception as e:
        print('Error! %s' % str(e))
