# lib/tic_tac_toe.rb
# Like a 5-year-old:
# - Board is 9 boxes
# - Players take turns placing X or O
# - After each move we check if someone has 3 in a row

class TicTacToe
  WIN_LINES = [
    [0,1,2],[3,4,5],[6,7,8], # rows
    [0,3,6],[1,4,7],[2,5,8], # cols
    [0,4,8],[2,4,6]          # diagonals
  ]

  def initialize
    @board = Array.new(9, " ")
    @current = "X"
  end

  def play
    loop do
      draw
      pos = ask_move
      @board[pos] = @current

      if winner?
        draw
        puts "#{@current} wins!"
        break
      end

      if full?
        draw
        puts "Draw!"
        break
      end

      switch_player
    end
  end

  private

  def draw
    puts
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts
  end

  def ask_move
    loop do
      print "Player #{@current}, pick 1-9: "
      input = gets&.strip
      next unless input && input.match?(/^[1-9]$/)

      idx = input.to_i - 1
      return idx if @board[idx] == " "
      puts "That spot is taken."
    end
  end

  def winner?
    WIN_LINES.any? do |a,b,c|
      @board[a] == @current && @board[b] == @current && @board[c] == @current
    end
  end

  def full?
    @board.none? { |x| x == " " }
  end

  def switch_player
    @current = (@current == "X" ? "O" : "X")
  end
end