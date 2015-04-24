require "rails_helper"

describe Calculator do

  before(:each) do
    @calculator = Calculator.new
  end

  describe '#sum' do
    it 'should sum 2 numbers' do
      expect(@calculator.sum(2,3)).to eq(5)
    end
  end

end
