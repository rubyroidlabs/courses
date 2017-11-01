arr = Array.new(10) { |a| rand(0..10) }

arr.each_slice(3) { |slice|  slice }

arr.each_slice(3) { |first, second, third|  [first, second, third] }

arr.each_with_index { |el, index|  [el, index] }
