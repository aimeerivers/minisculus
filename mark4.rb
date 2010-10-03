require 'mark2'

class Mark4 < Mark2

  def initialize(wheel1, wheel2)
    super(wheel1, wheel2)
    @wheel3 = 0
  end

  protected

  def transpose(position)
    index = increment_index(super(position), @wheel3 * 2)
    set_third_wheel(position)
    index
  end

  private

  def set_third_wheel(position)
    @wheel3 = position
  end

end
