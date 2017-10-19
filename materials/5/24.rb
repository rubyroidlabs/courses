arr = [1,2,3,4,5,6,7,8,9]

arr.reject { |a| a.even? }

arr.delete_if { |a| a.odd? }
