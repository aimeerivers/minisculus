require 'codebreaker'
require 'english_analyzer'

describe Codebreaker do

  context 'using mock objects for speed' do

    let(:result) { mock(:result) }
    let(:analyzer) { mock(:analyzer, :analyze => 0.5) }
    let(:mark4) { mock(:mark4, :decode => result, :analyzer => analyzer) }
    let(:codebreaker) { Codebreaker.new(analyzer) }

    before do
      Mark4.stub!(:new => mark4)
    end

    it 'tries every combination of wheels 1 and 2 on the Mark4' do
      Mark4.should_receive(:new).exactly(100).times
      codebreaker.decode('some kind of encrypted message')
    end

    it 'attempts to decode the message with each setting on the Mark4' do
      mark4.should_receive(:decode).exactly(100).times
      codebreaker.decode('some kind of encrypted message')
    end

    it 'analyzes the hit rate of each result' do
      analyzer.should_receive(:analyze).exactly(100).times
      codebreaker.decode('some kind of encrypted message')
    end

  end

  context 'actually doing the anazysis' do

    it 'returns the message giving the highest rate' do
      codebreaker = Codebreaker.new(EnglishAnalyzer.new)

      encrypted = "GBc KcEBeupLiMjQe1j\"UzQNXsF0qOWy\"8FBii2jQa ?4ca v\"ay0Mcz!4DSz0vuiG\"tmGf3fkSTfU!f3j\"PfzD4uto4v GfAIb npcUuGf3j\"!tyNutq0jVeG2?y3\"QBM6yfrC2v rcC'kj\"aTcyC71ZXx2\"PrF0ux2U.EQfI6k14\"kAZiAQay0TnzDA3GW"
      plaintext = "Salty Sands, as she is better known, was only one of almost 600 women that had the distinction to play in the AllAmerican Girls Professional Baseball League during its twelve years of history." 

      codebreaker.decode(encrypted).should == plaintext
    end

  end

end
