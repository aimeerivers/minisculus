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
    message.chars.to_a.reduce('') do |result, character|
      result += encode_character(character)
    end
  end

  protected

  def encode_character(character)
    return '' if position_of(character).nil?
    CHARSET[transpose(position_of(character))]
  end

  def position_of(character)
    CHARSET.index(character)
  end

  def transpose(index)
    increment_index(index, @wheel)
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
