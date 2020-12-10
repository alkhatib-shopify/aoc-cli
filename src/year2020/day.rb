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

    def path_exists(input, start, finish)
      input.prepend(start)
      input.append(finish)
      input.each_cons(2).map {|a,b| b-a}.all? {|x| x <= 3}
    end

    def part2(input)
      input = input.lines.map(&:to_i).sort
      start, finish = 0, input.max+3
      # start with full list of input, count if path exists [1,2,3,4]
      # remove 1 element at a time and count if path exists [1,2,3],  [2,3,4], [1,3,4] [
      total = 0
      (0..input.length+1).each do |n|
        p n
        input.combination(n).map do |x|
          total += 1 if path_exists(input - x, start, finish)
        end
      end
      total
    end
  end
end
