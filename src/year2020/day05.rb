input = File.readlines("input1.txt", sep="\n\n").map(&:chomp)

r = input.map do |x|
  x.split.map(&:chars).inject(:&).length
end.inject(:+)
puts r
