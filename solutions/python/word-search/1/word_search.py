class Point:
    def __init__(self, x: int, y: int):
        self.x = x
        self.y = y

    def __eq__(self, other) -> bool:
        return self.x == other.x and self.y == other.y


class WordSearch:
    def __init__(self, puzzle: list[str]):
        self.puzzle = puzzle

    def search(self, word: str) -> tuple[Point, Point]:
        lines = self.puzzle
        x_range = range(len(lines[0]))
        y_range = range(len(lines))
        for x in x_range:
            for y in y_range:
                for hor in [-1, 0, 1]:
                    for ver in [-1, 0, 1]:
                        if hor == 0 and ver == 0:
                            continue
                        test_word = ''
                        x_cur, y_cur = x, y
                        while y_cur in y_range and x_cur in x_range:
                            test_word = test_word + lines[y_cur][x_cur]
                            if test_word == word:
                                return (Point(x, y), Point(x_cur, y_cur))
                            x_cur, y_cur = x_cur + hor, y_cur + ver
        return None
