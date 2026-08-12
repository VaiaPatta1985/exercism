"""Tool to count steps in the Collatz sequence"""

def steps(number: int) -> int:
    """
    Calculates number of steps in the Collatz sequence,
    starting from input number.
    :param number (int): start of sequence
    :return (int): number of steps in sequence
    """
    if number <= 0:
        raise ValueError("Only positive integers are allowed")
    result = 0
    while number > 1:
        if number % 2 == 0:
            number = number / 2
        else:
            number = 3 * number + 1
        result = result + 1
    return result
