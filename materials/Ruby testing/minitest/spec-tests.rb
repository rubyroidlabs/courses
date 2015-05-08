require_relative "train"
require "minitest/autorun"
require "minitest/pride"

describe Train do
  describe "when created without params" do
    before do
      @train = Train.new
    end

    it "must have default name" do
      @train.name.must_equal "Uber train"
    end

    it "must have default size" do
      @train.size.must_equal 10
    end
  end

  describe "when created with specific params" do
    before do
      @train = Train.new 'Express', 1822
    end

    it "must have default name" do
      @train.name.must_equal 'Express'
    end

    it "must have default size" do
      @train.size.must_equal 1822
    end
  end
end
