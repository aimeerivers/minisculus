require 'mark1'

describe 'encoding a word' do
  context 'with a wheel setting of 1' do
    before do
      @device = Mark1.new(1)
    end

    it 'converts letter a to b' do
      @device.encode('a').should == 'b'
    end

    it 'converts letter c to d' do
      @device.encode('c').should == 'd'
    end

    it 'converts letter Z to a' do
      @device.encode('Z').should == 'a'
    end

    it 'converts ? to !' do
      @device.encode('?').should == '!'
    end

    it 'wraps around to the beginning' do
      @device.encode(' ').should == '0'
    end

  end

  context 'with a wheel setting of 2' do
    before do
      @device = Mark1.new(2)
    end

    it 'converts letter a to c' do
      @device.encode('a').should == 'c'
    end

    it 'wraps around to the beginning' do
      @device.encode(' ').should == '1'
    end
  end

  context 'encoding longer strings' do
    before do
      @device = Mark1.new(3)
    end

    it 'converts abc to def' do
      @device.encode('abc').should == 'def'
    end

    it 'converts a real word' do
      @device.encode('Hello').should == 'Khoor'
    end

    it 'still wraps around correctly' do
      @device.encode("! 0").should == ' 23'
    end
  end

  context 'invalid characters' do
    before do
      @device = Mark1.new(1)
    end

    it 'does not break' do
      @device.encode("$%^&").should == ''
    end

    it 'strips out invalid characters' do
      @device.encode("ab#c").should == 'bcd'
    end
  end

end
