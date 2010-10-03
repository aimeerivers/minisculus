require 'encoding_machine'

class Mark1 < EncodingMachine
  
  def initialize(wheel)
    @wheel = wheel
  end

  protected

  def encode_character(position)
    increment_index(position, @wheel)
  end

  def decode_character(position)
    decrement_index(position, @wheel)
  end

end
