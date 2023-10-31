require_relative "./Card.rb"
class Board
    CARDS = ("A".."H").to_a
    def initialize
        @cards = Array.new(4){Array.new(4)}
    end

    def populate
        shuffled_cards = CARDS + CARDS
        shuffled_cards.shuffle!
        shuffled_cards.map!{|face_val| Card.new(face_val)}
        shuffled_cards = shuffled_cards.each_slice(4).to_a
    end
end