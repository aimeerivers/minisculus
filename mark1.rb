class Mark1

  CHARSET = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    ".", ",", "?", "!", "'", "\"", " "
  ]
  
  def initialize(wheel)
    @wheel = wheel
  end

  def encode(message)
    transform(message, :encode_character)
  end

  def decode(message)
    transform(message, :decode_character)
  end

  protected

  def transform(message, function)
    message.chars.to_a.reduce('') do |result, character|
      result + transform_character(character, function)
    end
  end

  def transform_character(character, function)
    return '' if position_of(character).nil?
    CHARSET[self.send(function, position_of(character))]
  end

  def encode_character(position)
    increment_index(position, @wheel)
  end

  def decode_character(position)
    decrement_index(position, @wheel)
  end

  def position_of(character)
    CHARSET.index(character)
  end

  def increment_index(index, amount)
    index += amount
    index -= CHARSET.size while index >= CHARSET.size
    index
  end

  def decrement_index(index, amount)
    index -= amount
    index += CHARSET.size while index < 0
    index
  end

end
