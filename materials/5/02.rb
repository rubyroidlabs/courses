hash = {a: 1, 'b' => 2, 'c': 3, d: 4}

hash.each_air { |k, v| "Key: #{k}, Value: #{v}" }
hash.each { |k, v| "Key: #{k}, Value: #{v}" }
hash.map { |k, v| "Key: #{k}, Value: #{v}" }
