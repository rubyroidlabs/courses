require 'benchmark'

arr = Array.new(1_000_000) { |a| rand(0..1000) }

Benchmark.bmbm do |x|
  x.report('sort') { arr.dup.sort }
  x.report('sort_by') { arr.dup.sort_by(&:itself) }
end
