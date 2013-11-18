WIDTH=40
HEIGHT=40

matrixA = Array.new(HEIGHT) { Array.new(WIDTH) { rand(0..100) } }
matrixB = Array.new(HEIGHT) { Array.new(WIDTH) { rand(0..100) } }
matrixC = Array.new(HEIGHT) { Array.new(WIDTH) { rand(0..100) } }

adds, muls = 0, 0

0.upto(HEIGHT-1) do |i|
  0.upto(WIDTH-1) do |j|
    sum = 0
    0.upto(WIDTH-1) do |k|
      adds += 1
      muls += 1
      sum += matrixA[i][k] * matrixB[k][j]
    end
    matrixC[i][j] = sum
  end
end

puts "Adds: #{adds}"
puts "Muls: #{muls}"
