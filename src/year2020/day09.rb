module Year2020
  class Day09
    def part1(input)
      preamble = 25
      missing = input.lines.map(&:strip).map(&:to_i).each_cons(preamble + 1).filter do |x|
        last = x.last
        sum_exists = false
        first_n = x.first(preamble)
        first_n.each {|n| sum_exists = true if first_n.include?(last - n)  }
        !sum_exists
      end
      missing[0][preamble]
    end

    def part2(input)
      target = 1309761972
      (2..input.length).each do |n|
        input.lines.map(&:strip).map(&:to_i).each_cons(n) do |x|
          p x, x.min + x.max if x.sum == target
        end
      end
    end
  end
end
