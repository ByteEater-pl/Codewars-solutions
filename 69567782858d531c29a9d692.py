def xor_cipher(text, key):
    def keychars():
        yield from key
        yield from keychars()
    return ''.join(
        chr(ord(t) ^ ord(k))
        for t, k in zip(text, keychars()))
