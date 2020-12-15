module Year2020
  class Day15

    def speak(spoken_list)
      *rest, last = spoken_list
      index_from_end = rest.reverse.index(last)
      return 0 if index_from_end.nil?
      index_from_end + 1
    end

    def part1(input)
      spoken = input.split(',').map(&:to_i)
      spoken << 0
      p spoken
      while spoken.length < 2020
        spoken << speak(spoken)
      end
      spoken.last
    end

    def part2(input)
      nil
    end
  end
end
