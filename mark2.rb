require 'mark1'

class Mark2 < Mark1

  def initialize(wheel1, wheel2)
    super(wheel1)
    @wheel2 = wheel2
  end

  def transpose(index)
    decrement_index(super(index), @wheel2 * 2)
  end

end
