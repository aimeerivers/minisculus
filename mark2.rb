require 'mark1'

class Mark2 < Mark1

  def initialize(wheel1, wheel2)
    super(wheel1)
    @wheel2 = wheel2
  end

  protected

  def encode_character(position)
    decrement_index(super(position), @wheel2 * 2)
  end

end
