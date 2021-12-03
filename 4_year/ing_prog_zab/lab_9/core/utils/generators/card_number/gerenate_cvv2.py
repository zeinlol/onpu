from random import Random


def generate_cvv_2() -> str:
    generator = Random()
    generator.seed()  # Seed from current time
    cvv_2 = ''
    for _ in range(3):
        digit = str(generator.choice(range(10)))
        cvv_2 += digit
    return cvv_2
