require 'mark2'
require 'mark1'

describe Mark2 do

  it 'encodes abc to STU' do
    Mark2.new(2,5).encode('abc').should == 'STU'
  end

  it 'is equivalent when going forwards 6 and backwards 3*2' do
    Mark2.new(6,3).encode('abc').should == 'abc'
  end

  it 'successfully loops round both ways' do
    Mark2.new(8,5).encode('.,?!').should == 'yz.,'
  end

  it 'includes spaces' do
    Mark2.new(2,1).encode('test with spaces').should == 'test with spaces'
  end

  it 'can be functionally equivalent to a Mark1' do
    message = "whatever you like, it doesn't actually matter"
    Mark2.new(8,2).encode(message).should == Mark1.new(4).encode(message)
  end

end
