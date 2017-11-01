arr = [1,2,3,4,5,6,7,8,9]

arr.select { |a| a.even? }

arr.keep_if { |a| a.odd? }
