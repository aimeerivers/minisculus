require 'mark4'

class Codebreaker

  def initialize(analyzer)
    @analyzer = analyzer
  end

  def decode(message)
    results = collect_results(message).flatten
    probabilities = results.map{|result| @analyzer.analyze(result) }
    results[probabilities.index(probabilities.max)]
  end

  private

  def collect_results(message)
    (0..9).map{|wheel1| (0..9).map{|wheel2| Mark4.new(wheel1, wheel2).decode(message) } }
  end

end
