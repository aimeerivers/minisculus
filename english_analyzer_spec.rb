require 'english_analyzer'

describe EnglishAnalyzer do

  let(:analyzer) { EnglishAnalyzer.new }

  it 'returns 0 for the probabliity of a blank message' do
    analyzer.analyze('').should == 0
  end

  it 'increases the probability for English words' do
    analyzer.analyze('each peach pear plum').should > analyzer.analyze('RYSb3ayYSb3ayYhNa\" 9')
  end

  it 'increases the probability for an English phrase' do
    message = "People who had seen him were able to give a description."
    encoded = "GCq42u1lCwLWiX h1gpJWqwHl9t 1PVhu1iDLVo\"71P.Seu p3zA7y2D"
    analyzer.analyze(message).should > analyzer.analyze(encoded)
  end

end
