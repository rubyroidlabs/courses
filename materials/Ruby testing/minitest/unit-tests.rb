require_relative "train"
require "minitest/autorun"
require "minitest/pride"


class TestTrain < Minitest::Test
  def setup
    @train = Train.new
  end

  def test_that_train_has_default_name
    assert_equal 'Uber  train', @train.name
  end

  def test_that_train_has_default_size
    assert_equal 10, @train.size
  end
end
