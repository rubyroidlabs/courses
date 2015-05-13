require_relative "train"
require "minitest/autorun"

class TestTrain < Minitest::Test
  def setup
    @train = Train.new
  end

  def test_1pm
    Time.stub :now, 1PM do   # stub goes away once the block is done
      assert_equal true, @train.will_arrive_by_the_end_of_the_day?(3 * 24 * 3600)
    end
  end
end
