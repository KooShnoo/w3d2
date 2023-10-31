require_relative 'Board'
require_relative 'Card'
class Game
  def initialize
    @board = Board.new
    @board.populate
    @previous_guess = []
  end

  def play
    @board.render
  end

  def prompt
    p "Please enter the position of the card you'd like to flip, ( e.g., '2,3')"
    guessed_pos = gets.chomp.split(',').map(&:to_i)
    make_guess(guessed_pos)
  end

  def make_guess(guessed_pos)
    if @previous_guess.empty?
      @board.reveal(guessed_pos)
      @previous_guess = guessed_pos
    else
      if @board[guessed_pos] == @board[@previous_guess]
        @board.reveal(guessed_pos)
        @board.reveal(@previous_guess)
      else
        @board.hide(guessed_pos)
        @board.hide(@previous_guess)
      end
      @previous_guess = []
    end
  end
end
