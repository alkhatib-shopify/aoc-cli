module Year2020
  class Day15
    def part1(input, limit = 2020)
      spoken = input.split(',').map(&:to_i)
      spoken_dict = spoken.each_with_index.to_h
      current_index = spoken_dict.values.last + 1
      next_spoken = 0
      (current_index...limit - 1).each do
        print '.' if (current_index % 100_000).zero?
        next_spoken_index = spoken_dict.delete(next_spoken)
        spoken_dict[next_spoken] = current_index
        next_spoken = if next_spoken_index.nil?
                        0
                      else
                        current_index - next_spoken_index
                      end
        current_index += 1
      end
      next_spoken
    end

    def part2(input)
      part1(input, 30_000_000)
    end
  end
end
