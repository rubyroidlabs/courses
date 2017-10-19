arr = [1,2,3,4,5,6,7]
arr1 = Array.new(5, 1)

arr.all? { |a| a.odd? }
arr1.all? { |a| a.odd? }

arr.any? { |a| a.odd? }

arr1.none? { |a| a.even? }
