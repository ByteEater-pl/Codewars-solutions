def get_count(sentence):
    return sum(v in ('aeiou') for v in sentence)
