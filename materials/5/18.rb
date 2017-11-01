arr = [1,2,3,4,5,6,7,8,9,0].shuffle

arr.sort
arr.sort_by { |a| a } # arr.sort_by(&:itself)
