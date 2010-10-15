require 'analyzer'

class EnglishAnalyzer < Analyzer

  COMMON_LETTERS = {
    ' ' => 0.2,
    'E' => 0.12702,
    'T' => 0.09056,
    'A' => 0.08167,
    'O' => 0.07507,
    'I' => 0.06966,
    'N' => 0.06749,
    'S' => 0.06327,
    'H' => 0.06094,
    'R' => 0.05987
  }

  def analyze(message)
    number_of_characters = characters_in(message)
    return 0 if number_of_characters == 0
    probability = 0.5
    occurrences = character_occurrences_in(message)

    COMMON_LETTERS.each do |letter, frequency|
      occurrence_of_letter = occurrence_of(letter, occurrences).to_f / number_of_characters
      ratio = (frequency - occurrence_of_letter).abs
      probability *= (1 - ratio)
    end

    probability
  end

  def character_occurrences_in(message)
    message.upcase.chars.reduce({}) do |hash, character|
      hash[character] ||= 0
      hash[character] += 1
      hash
    end
  end

  def occurrence_of(character, occurrences)
    occurrences[character] || 0
  end

  def characters_in(message)
    message.upcase.chars.reduce(0) do |sum, character|
      sum += 1 if ('A'..'Z').include? character || character == ' '
      sum
    end
  end

end
