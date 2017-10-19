arr = [1,2,3,4,5]

arr.fetch(0)
arr.fetch(-1)
arr.fetch(5, 'NOPE!')
arr.fetch(5) { |i| "No index: #{i}" }
