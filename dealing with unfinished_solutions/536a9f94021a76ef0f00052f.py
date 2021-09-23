def reverse(str):
    return str and reverse(str[1:]) + str[0]
