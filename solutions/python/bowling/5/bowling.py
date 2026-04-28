"""
Module to score a bowling game.
"""
class BowlingGame:
    """
    Scores a bowling game. Records rolls, keeps score, can output score at the end.
    """
    def __init__(self):
        self.rolls = [[]]
        self.scores = []
        self.pins_left_in_frame = 10
        self.second_throw = False
        self.current_frame = 0
        self.frame_being_scored = 0

    def __update_score(self):
        while self.frame_being_scored < 10:
            try:
                throws_to_score = self.rolls[self.frame_being_scored]
            except IndexError:
                break
            next_roll = []
            try:
                next_roll = self.rolls[self.frame_being_scored + 1]
            except IndexError:
                pass
            match len(throws_to_score):
                case 0:
                    break
                case 1:
                    if not next_roll:
                        break
                    f_score = 10 + sum(next_roll)
                    if throws_to_score == [10]:
                        try:
                            if len(next_roll) == 1:
                                f_score += self.rolls[self.frame_being_scored + 2][0]
                        except IndexError:
                            break
                case 2:
                    f_score = sum(throws_to_score)
                    if f_score == 10:
                        try:
                            f_score += next_roll[0]
                        except IndexError:
                            break
            self.scores.append(f_score)
            self.frame_being_scored += 1

    def roll(self, pins: int):
        """
        Records rolls, updates score.
        """
        if not isinstance(pins, int):
            raise Exception('Integer number of pins expected.')

        if pins not in range(0, self.pins_left_in_frame + 1):
            raise Exception('Impossible number of pins knocked down.')

        if self.frame_being_scored == 10:
            raise Exception('No throws left.')

        self.rolls[self.current_frame].append(pins)
        self.pins_left_in_frame -= pins
        self.__update_score()
        if pins == 10 or self.second_throw:
            self.second_throw = False
            self.current_frame += 1
            self.rolls.append([])
            self.pins_left_in_frame = 10
        else:
            self.second_throw = True

    def score(self):
        """
        Outputs score for a finished game.
        """
        if self.frame_being_scored < 10:
            raise Exception('Throws still left.')
        return sum(self.scores)
