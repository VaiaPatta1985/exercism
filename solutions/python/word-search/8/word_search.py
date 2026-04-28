"""
Implements a wordsearch puzzle with search for a given word.
"""


class Point:
    """
    A pair of integer coordinates; can check equality.
    """
    def __init__(self, column: int, row: int):
        self.column = column
        self.row = row

    def __eq__(self, other) -> bool:
        return self.column == other.column and self.row == other.row

    def __hash__(self) -> int:
        return hash((self.column, self.row))


class WordSearch:
    """
    A word puzzle; `search` searches the puzzle for a given word; `search_all` solves for a set of words.
    """
    def __init__(self, puzzle: list[str]):
        self.puzzle = puzzle

    def search(self, word: str) -> tuple[Point, Point] | None:
        """
        Searches the puzzle for a given word in all 8 possible directions and returns the start and end coordinates of the first finding (or None if not found).
        """
        lines = self.puzzle
        x_range = range(len(lines[0]))
        y_range = range(len(lines))
        for (x_start, y_start, hor, ver) in [(x_var, y_var, h_var, v_var) for x_var in x_range for y_var in y_range for h_var in [-1, 0, 1] for v_var in [-1, 0, 1] if h_var != 0 or v_var != 0]:
            test_word = ''
            x_cur, y_cur = x_start, y_start
            while y_cur in y_range and x_cur in x_range:
                test_word = test_word + lines[y_cur][x_cur]
                if test_word == word:
                    return (Point(x_start, y_start), Point(x_cur, y_cur))
                x_cur, y_cur = x_cur + hor, y_cur + ver
        return None

    def search_all(self, words: list[str]) -> list[tuple[Point, Point]] | None:
        """
        Solves the puzzle for a set of words; returns None if not all words are found.
        """
        result = []
        for word in words:
            coords = self.search(word)
            if coords is None:
                return None
            result.append(coords)
        return result
