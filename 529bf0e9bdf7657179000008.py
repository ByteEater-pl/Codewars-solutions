def valid_solution(board):
    r = range(0, 9, 3)
    return len(set(map(frozenset, (
            range(1, 10),
            *board,
            *zip(*board),
            *((x
                    for a in board[i:][:3]
                    for x in a[j:][:3])
                for i in r
                for j in r)
        )))) == 1
