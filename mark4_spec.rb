require 'mark4'
require 'mark2'

describe Mark4 do

  it 'encodes the first character exactly the same as a Mark2' do
    character = 'a'
    Mark4.new(2,8).encode(character).should == Mark2.new(2,8).encode(character)
  end

  context 'with first two wheels that cancel each other out' do
    before do
      @device = Mark4.new(2,1)
    end

    it 'can be configured so that the first character does not change' do
      @device.encode('0').should == '0'
    end

    it 'uses the position of the first character to set the third wheel position' do
      @device.encode('00').should == '00'
    end

    it 'works on previous characters input' do
      @device.encode('012').should == '014'
    end

    it 'works further through the alphabet' do
      @device.encode('AAA').should == 'AUU'
    end

    it 'can wrap around once just fine' do
      # Z is at position 36 so we have to rotate round 72 places
      # which is all the way round and back past the Z
      @device.encode('ZZ').should == 'Za'
    end

    it 'can even wrap around more than once' do
      # z is at position 62 so we have to rotate round 124 places
      # Since there are only 69 charcters in the set,
      # we have to rotate around to the beginning more than once
      @device.encode('zz').should == 'zj'
    end

    it 'works on real words and everything!' do
      @device.encode('Lady GaGa').should == 'L9g0oE J '
    end
  end

  it 'works on other examples' do
    Mark4.new(4,7).encode('HI').should == '7g'
  end

  it 'wraps around just fine' do
    Mark4.new(4,5).encode('" ').should == 'zw'
  end

  it 'resets the machine in between encodings' do
    device = Mark4.new(3,9)
    device.encode('abc').should == device.encode('abc')
  end

  context 'decoding' do
    it 'correctly encodes and decodes a message' do
      message = "Anything at all! Just try it, it's not going to do any harm, is it?!"
      device = Mark4.new(5,9)
      device.decode(device.encode(message)).should == message
    end
  end

end
