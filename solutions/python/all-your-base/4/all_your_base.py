"""
Tools to convert between numerical bases.
"""


def flatten(my_list: list) -> list:
    """
    Flattens a list with nestings.
    """
    result = []
    for elem in my_list:
        if isinstance(elem, list):
            if elem:
                result += flatten(elem)
        elif elem is not None:
            result.append(elem)
    return result


def write_out(num: int, base: int) -> list[int] | None:
    """
    Writes an integer in a given base.
    """
    part_dig = None
    rest = num // base
    if rest > 0:
        part_dig = write_out(rest, base)
    result = flatten([part_dig, num % base])
    if None in result:
        result.remove(None)
    return result


def rebase(input_base: int, digits: list[int], output_base: int) -> list[int]:
    """
    Converts an integer representation between bases.
    """
    if input_base <= 1:
        raise ValueError('input base must be >= 2')
    for num in digits:
        if not 0 <= num < input_base:
            raise ValueError('all digits must satisfy 0 <= d < input base')
    if output_base <= 1:
        raise ValueError('output base must be >= 2')
    val = sum([digits[-1 - idx] * input_base ** idx for idx in range(len(digits))])
    return write_out(val, output_base)
