class Card

  attr_reader :face_down, :face_val
  def initialize(face_val)
    @face_val = face_val
    @face_down = true
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def to_s
    @face_val.to_s
  end

  def ==(other_card)
    @face_val == other_card.face_val
  end
end
