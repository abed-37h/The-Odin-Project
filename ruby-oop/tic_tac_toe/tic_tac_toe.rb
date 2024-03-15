

class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end


class Board
  def initialize
    @board = [
      1, 2, 3,
      4, 5, 6,
      7, 8, 9
    ]
  end

  def move(position, mark)
    mark.upcase!

    unless position.between?(1, 9) &&
           @board[position - 1].is_a?(Integer) &&
           (mark == 'X' || mark == 'O')
      return nil
    end

    @board[position - 1] = mark

    win_move?(position) ? 'win' : 'ongoing'
  end

  def full?
    @board.all? { |mark| mark == 'O' || mark == 'X' }
  end

  def to_s
    "#{@board[0]} | #{@board[1]} | #{@board[2]}\n"\
    "-----------\n"\
    "#{@board[3]} | #{@board[4]} | #{@board[5]}\n"\
    "-----------\n"\
    "#{@board[6]} | #{@board[7]} | #{@board[8]}\n"\
  end

  private

  def win_move?(position)
    x = (position - 1) / 3
    y = (position - 1) % 3

    return true if @board[3 * x] == @board[3 * x + 1] && @board[3 * x] == @board[3 * x + 2]

    return true if @board[y] == @board[y + 3] && @board[y] == @board[y + 6]

    return true if x == y && @board[0] == @board[4] && @board[4] == @board[8]
    
    return true if x + y == 2 && @board[2] == @board[4] && @board[4] == @board[6]

    false
  end
end
