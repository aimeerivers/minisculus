require 'mark1'

class Mark2 < Mark1

  def initialize(wheel1, wheel2)
    super(wheel1)
    @wheel2 = wheel2
  end

  def transpose(index)
    index = super(index)
    index -= @wheel2 * 2
    index += CHARSET.size if index < 0
    index
  end

end
