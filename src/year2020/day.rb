module Year2020
  class Day
    def part1(input)
      input = input.lines.map(&:to_i).sort
      input.prepend(0)
      input.append(input.max+3)
      p input.each_cons(2).map
      p input.each_cons(2).map {|a,b| b-a }
      counts = input.each_cons(2).map {|a,b| b-a }.tally
      p counts
      counts[1] * counts[3]
    end

    def part2(input)
      input = input.lines.map(&:to_i).sort
      input.prepend(0)
      input.append(input.max+3)
      h = Hash.new(0)
      input.each_cons(4) do |first, *candidates|
        candidates.each {|c| h[c] += 1 if (c - first).between?(1,3)}
      end
      p h
      p h.values.select {|val| val > 1}.sum + 1
    end
  end
end
