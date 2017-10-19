hash = {a: 1, 'b' => 2, 'c': 3, d: 4}

'a:'
hash.key?(:a)
hash.key?('a')
'b:'
hash.key?(:b)
hash.key?('b')
'c:'
hash.key?(:c)
hash.key?('c')
