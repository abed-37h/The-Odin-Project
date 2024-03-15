

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

    if win_move?(position)
      'Win'
    elsif full?
      'Draw'
    else
      'Ongoing...'
    end
  end

  def to_s
    "#{@board[0]} | #{@board[1]} | #{@board[2]}\n"\
    "-----------\n"\
    "#{@board[3]} | #{@board[4]} | #{@board[5]}\n"\
    "-----------\n"\
    "#{@board[6]} | #{@board[7]} | #{@board[8]}\n"\
  end

  private

  def full?
    @board.all? { |mark| mark == 'O' || mark == 'X' }
  end

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

class TicTacToeGame
  def initialize(player1_name, player2_name, xo)
    if xo
      @player1 = Player.new(player1_name, 'X')
      @player2 = Player.new(player2_name, 'O')
      @turn = true
    else
      @player1 = Player.new(player1_name, 'O')
      @player2 = Player.new(player2_name, 'X')
      @turn = false
    end
    @board = Board.new
  end

  def move(position)
    current_player = @turn ? @player1 : @player2

    @turn = !@turn

    result = @board.move(position, current_player.mark)

    if result == 'Win'
       "Hooray! #{current_player.name} wins."
    else
      result
    end
  end

  def display
    puts @turn ?
      "#{@player1.name}: #{@player1.mark}" :
      "#{@player2.name}: #{@player2.mark}"
    puts @board
  end
end

stop_game = false
until stop_game
  print "Player1: "
  player1_name = gets.chomp

  print "Player2: "
  player2_name = gets.chomp

  puts "[1] #{player1_name}: X\t#{player2_name}: O"
  puts "[0] #{player1_name}: O\t#{player2_name}: X"
  print "Choose combination: "
  xo = gets.chomp.to_i == 0 ? false : true

  game = TicTacToeGame.new(player1_name, player2_name, xo)

  loop do
    game.display

    print 'Position: '
    position = gets.chomp.to_i

    result = game.move(position)
    unless result
      puts "Invalid position: #{position}. Play again.\n\n"
      next
    end

    puts "#{result}\n\n"

    break if result.end_with?('wins.') || result == 'Draw'
  end

  print "Play again? [1: Yes, 0: No] "
  stop_game = gets.chomp.to_i == 1 ? false : true
end
