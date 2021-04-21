import keyboard

space_num = 0
all_nums = 0


def percentage(part, whole):
    return round(100 * float(part) / float(whole), 3)


def print_pressed_keys(e):
    global space_num, all_nums
    if e.event_type == 'down':
        all_nums += 1
        if e.name == 'space':
            space_num += 1
        percent = str(percentage(space_num, all_nums))
        print("Spaces: %s, percent of all inputs: %s percents" % (str(space_num), percent), end='\r')
        # print(e, e.event_type, e.name)


print("Press 'ESC' to exit. all other keys will be counted")
keyboard.hook(print_pressed_keys)
keyboard.wait('esc')
