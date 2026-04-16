"""
Tools to flatten lists.
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
