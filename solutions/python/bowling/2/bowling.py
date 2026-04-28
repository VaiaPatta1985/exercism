class BowlingGame:
    def __init__(self):
        self.rolls = [[]]
        self.scores = []
        self.pins_left_in_frame = 10
        self.second_throw = False
        self.current_frame = 0
        self.frame_being_scored = 0

    def __update_score__(self):
        while self.frame_being_scored < 10:
            try:
                throws_to_score = self.rolls[self.frame_being_scored]
                if not throws_to_score:
                    break
            except IndexError:
                break
            if len(throws_to_score) == 1:
                try:
                    if not self.rolls[self.frame_being_scored + 1]:
                        break
                except IndexError:
                    break
            if throws_to_score == [10]:
                if len(self.rolls[self.frame_being_scored + 1]) < 2:
                    try:
                        if not self.rolls[self.frame_being_scored + 2]:
                            break
                    except IndexError:
                        break
                    self.scores.append(
                        10 + self.rolls[self.frame_being_scored + 1][0] + self.rolls[self.frame_being_scored + 2][0])
                else:
                    self.scores.append(10 + sum(self.rolls[self.frame_being_scored + 1]))
            if len(throws_to_score) == 2:
                raw_score = sum(throws_to_score)
                if raw_score == 10:
                    try:
                        if not self.rolls[self.frame_being_scored + 1]:
                            break
                    except IndexError:
                        break
                    self.scores.append(10 + self.rolls[self.frame_being_scored + 1][0])
                else:
                    self.scores.append(raw_score)
            self.frame_being_scored += 1

    def roll(self, pins: int):

        if not isinstance(pins, int):
            raise Exception('Integer number of pins expected.')

        if pins not in range(0, self.pins_left_in_frame + 1):
            raise Exception('Impossible number of pins knocked down.')

        if self.frame_being_scored == 10:
            raise Exception('No throws left.')

        self.rolls[self.current_frame].append(pins)
        self.pins_left_in_frame -= pins
        self.__update_score__()
        if pins == 10 or self.second_throw:
            self.second_throw = False
            self.current_frame += 1
            self.rolls.append([])
            self.pins_left_in_frame = 10
        else:
            self.second_throw = True

    def score(self):
        if self.frame_being_scored < 10:
            raise Exception('Throws still left.')
        return sum(self.scores)
