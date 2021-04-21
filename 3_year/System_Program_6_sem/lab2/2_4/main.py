def split_input(string):
    size_values = string.split(' ')
    size_values = list(filter(None, size_values))
    for i in range(0, len(size_values)):
        size_values[i] = int(size_values[i])
    return size_values


def make_array(size):
    arr = [[0]*size[1]]*size[0]
    print(arr)
    for row in range(0, len(arr)):
        for col in range(0, len(arr[row])):
            arr[row][col] = row + col
            print(str(arr[row][col]).rjust(3, ' '), end=' ')
        print('')


while True:
    print("Enter 'M' and 'N' numbers. Like '4 7'")
    try:
        num = input()
        values = split_input(num)
        make_array(values)
    except ValueError:
        print('Enter only number!')
    except IndexError:
        print('Enter 2 values!')
    except MemoryError:
        print('Arguments are too large!')
    except Exception as e:
        print('Error! %s' % str(e))
