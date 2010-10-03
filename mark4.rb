require 'mark2'

class Mark4 < Mark2

  def initialize(wheel1, wheel2)
    super(wheel1, wheel2)
    reset_encoder
  end

  def reset_encoder
    @wheel3 = 0
  end

  protected

  def encode_character(position)
    increment_index(super(position), @wheel3 * 2)
  end

  def after_encode_character(position, result)
    set_third_wheel(position)
  end

  def decode_character(position)
    super(decrement_index(position, @wheel3 * 2))
  end

  def after_decode_character(position, result)
    set_third_wheel(position_of(result))
  end

  private

  def set_third_wheel(position)
    @wheel3 = position
  end

end
