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
    until @board.won? do 
        guessed_pos = prompt
        result = make_guess(guessed_pos)
    end
    p " you won!!!"
  end

  def give_feedback(successful)
    system("clear")
    @board.render 
    p "its' a match" if successful 
    p "try again"  if successful == false 
    sleep(2)
  end

  def prompt
    loop do 
        p "Please enter the position of the card you'd like to flip, ( e.g., '2,3')"
        guess = gets.chomp.split(',').map(&:to_i)
        p @previous_guess
        return guess if guess.none? {|coord| coord < 0 || coord > 3}
        p "Invaild position please try again"
    end
  end

  def make_guess(guessed_pos)
    if @previous_guess.empty?
      @board.reveal(guessed_pos)
      @previous_guess = guessed_pos
      give_feedback(nil)
      return 
    end 

    correct = @board[guessed_pos] == @board[@previous_guess]
    if correct
        @board.reveal(guessed_pos)
        @board.reveal(@previous_guess)
        give_feedback(true)
    else
        @board.reveal(guessed_pos)
        give_feedback(false)
        @board.hide(guessed_pos)
        @board.hide(@previous_guess)
        give_feedback(nil)
    end
    @previous_guess = []
    correct
  end
end
