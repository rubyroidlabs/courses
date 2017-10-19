arr = Array.new(20) { |a| rand(0..10) }

arr.chunk { |a| a > 5 }.each { |more_than_5, ary| p [more_than_5, ary] }
