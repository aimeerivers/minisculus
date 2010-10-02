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

  def encode_character(character)
    index = position_of(character)
    return '' if index.nil?
    index += @wheel
    index -= CHARSET.size if index >= CHARSET.size
    CHARSET[index]
  end

  def position_of(character)
    CHARSET.index(character)
  end

end
