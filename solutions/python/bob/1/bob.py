def response(hey_bob):
    hey_bob_minus_whitespace = hey_bob
    for char in [' ', '\n', '\r', '\t']:
        hey_bob_minus_whitespace = hey_bob_minus_whitespace.replace(char,'')
    if not hey_bob_minus_whitespace:
        return 'Fine. Be that way!'
    is_all_capitals = hey_bob_minus_whitespace == hey_bob_minus_whitespace.upper() and hey_bob_minus_whitespace != hey_bob_minus_whitespace.lower()
    if hey_bob_minus_whitespace.endswith('?'):
        if is_all_capitals:
            return 'Calm down, I know what I\'m doing!'
        return 'Sure.'
    if is_all_capitals:
        return 'Whoa, chill out!'
    return 'Whatever.'