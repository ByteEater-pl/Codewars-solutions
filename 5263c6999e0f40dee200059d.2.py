def get_pins(observed):
    match observed:
        case [d, *o]:
            return [h + t
                for t in
                    get_pins(o)
                for h in
                    ('8', '24', '153', '26', '157', '2468', '359', '48', '0579', '68')
                    [int(d)]
                    + d
                ]
    return ['']
