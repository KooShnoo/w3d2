class Card
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
end
