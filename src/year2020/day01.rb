module Year2020
  class Day01
    def part1(input)
      input = input.lines.map(&:to_i).sort
      start = 0
      finish = -1
      while input[start] + input[finish] != 2020
        if input[start] + input[finish] > 2020
          finish -= 1
        elsif input[start] + input[finish] < 2020
          start += 1
        end
      end
      input[start] * input[finish]
    end

    def part2(input)
      input = input.lines.map(&:to_i).sort
      start = 0
      mid = 1
      finish = input.size - 1
      while input[start] + input[mid] + input[finish] > 2020
        finish -= 1
      end
      while input[start] + input[mid] + input[finish] < 2020 && mid < finish - 1
        mid += 1
      end
      while input[start] + input[mid] + input[finish] < 2020 && start < mid - 1
        start += 1
      end
      input[start] * input[mid] * input[finish]
    end
  end
end
