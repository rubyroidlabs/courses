require 'test_helper.rb'
require 'minitest/autorun'

describe Calculator do

  before do
    @calculator = Calculator.new
  end

  describe '#sum' do
    it 'should sum 2 numbers' do
      @calculator.sum(2,3).must_equal 5
    end

    it 'should sum 2 numbers' do
      @calculator.sum(6.0, 42.2).must_equal 48.2
    end

    it 'should sum 2 numbers' do
      @calculator.sum(6, 42).must_equal 48
    end

    it 'should not sum number and string' do
      @calculator.sum(6.0, '12').must_raise ArgumentError
    end

    it 'should not sum number 2and object' do
      @calculator.sum(6.0, '12').must_raise ArgumentError
    end

  end

end
