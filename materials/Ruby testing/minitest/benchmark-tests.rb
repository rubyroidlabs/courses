require_relative "train"
require "minitest/autorun"
require "minitest/benchmark"

class TestTrain < Minitest::Benchmark
  # Override self.bench_range or default range is [1, 10, 100, 1_000, 10_000]
  def self.bench_range
    [1, 10, 100, 1_000, 10_000]
  end

  def bench_time_to_next_station
    @train = Train.new

    assert_performance_linear 0.9999 do |distance| # n is a range value
      @train.get_to_next_station(distance)
    end
  end
end
