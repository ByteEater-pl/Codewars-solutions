def pig_it(text):
    return ' '.join(
        f'{w[1:]}{w[0]}ay' if w.isalpha() else w
        for w in text.split())
