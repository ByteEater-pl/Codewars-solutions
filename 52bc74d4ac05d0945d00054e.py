def first_non_repeating_letter(string):
    import collections
    return next(
        (l for l in string if l.lower() in
            {c for c, n in collections.Counter(string.lower()).items() if n < 2}),
        "")
