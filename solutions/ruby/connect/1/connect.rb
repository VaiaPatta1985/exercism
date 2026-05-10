class Board
  CONNECTIONS = [[-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0]]
  TOP_TO_BOTTOM_PLAYER = 'O'
  LEFT_TO_RIGHT_PLAYER = 'X'

  attr_accessor :winner
  
  def initialize(board)
    @board = board.map { |row| row.gsub(' ', '') }.map(&:chars)
    @width = @board[0].length
    @height = @board.length
    top_row = (0...@width).to_a.map { |y| [0, y] }
    left_column = (0...@height).to_a.map { |x| [x, 0] }
    check_bottom_row = ->(coordinates){ return (coordinates[0] == @height - 1) }
    check_right_column = ->(coordinates){ return (coordinates[1] == @width - 1) }
    @winner = ''
    if exists_path?(TOP_TO_BOTTOM_PLAYER, top_row, check_bottom_row)
      @winner = TOP_TO_BOTTOM_PLAYER
      return
    end
    @winner = LEFT_TO_RIGHT_PLAYER if exists_path?(LEFT_TO_RIGHT_PLAYER, left_column, check_right_column)
  end

  def exists_path?(player, start_play, end_play)
    positions = start_play.select { |coordinates|
      @board[coordinates[0]][coordinates[1]] == player
    }
    return false if positions.empty?
    previous_positions = []
    while previous_positions != positions do
      previous_positions = positions
      candidates = []
      candidates.concat(positions.map { |coordinates|
        CONNECTIONS.map { |connection|
          (0..1).to_a.map { |xy| connection[xy] + coordinates[xy] }
        }
      })
      candidates = candidates.flatten(1).uniq.select { |coordinates|
        coordinates.all? { |xy| xy >= 0 }
      }
      positions += candidates.select { |coordinates|
        !(@board[coordinates[0]].nil?) && @board[coordinates[0]][coordinates[1]] == player
      }
      positions.uniq!
      return true if positions.any? { |coordinates| end_play.(coordinates) }
    end
    return false
  end
end
