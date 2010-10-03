require 'mark2'

class Mark4 < Mark2

  def initialize(wheel1, wheel2)
    super(wheel1, wheel2)
    @wheel3 = 0
  end

  def transpose(position)
    index = super(position)
    index += @wheel3 * 2
    while index >= CHARSET.size
      index -= CHARSET.size
    end
    set_third_wheel(position + 1)
    index
  end

  private

  def set_third_wheel(position)
    @wheel3 = position
  end

end
