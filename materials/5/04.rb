hash = {a: 1, 'b' => 2, 'c': 3, d: 4}

hash.value?(3)
hash.value?(10)

hash.transform_values { |v| v + 2 }
