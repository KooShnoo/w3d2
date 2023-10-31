require_relative './Card'
class Board
  CARDS = ('A'..'H').to_a
  def initialize
    @cards = Array.new(4) { Array.new(4) }
  end

  def [](pos)
    row, col = pos
    @cards[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @cards[row][col] = value
  end

  def populate
    shuffled_cards = CARDS + CARDS
    shuffled_cards.shuffle!
    shuffled_cards.map! { |face_val| Card.new(face_val) }
    shuffled_cards = shuffled_cards.each_slice(4).to_a
    @cards = shuffled_cards
  end

  def render
    @cards.each do |row|
      p(row.map do |card|
        next '_' if card.face_down

        card.face_val
      end)
    end
  end

  def won?
    @cards.all? { |row| row.all? { |card| card.face_down == false } }
  end

  def reveal(guessed_pos)
    row, col = guessed_pos
    card = @cards[row][col]
    card.reveal
    card
  end

  def hide(guessed_pos)
    row, col = guessed_pos
    card = @cards[row][col]
    card.hide
    card
  end
end
