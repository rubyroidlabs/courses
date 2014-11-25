require 'spec_helper'

describe 'MyStruct' do
  subject { MyStruct.new(hash) }
  let(:hash) { Hash.new }

  it 'should return us 1' do
    hash[:a] = 1
    subject.a.should == 1
  end

  it 'should return us 3 when a is 3' do
    hash[:b] = 3
    subject.b.should == 3
  end

  it 'should return us 17 when a is 17' do
    hash[:abc] = 17
    subject.abc.should eq(17)
  end

  it 'should return us 3 when a is 3' do
    hash[:abd] = 10
    subject.abd.should eq(10)
  end

  it 'should return us 3 when a is 3' do
    hash[:pavlik] = 10
    subject.pavlik = 15
    subject.pavlik.should eq(15)
  end

end
