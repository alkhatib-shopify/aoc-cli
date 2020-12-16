module Year2020
  class Day15

    def part1(input, limit=2020)
      spoken = input.split(',').map(&:to_i)
      current_index = nil
      spoken_dict = {}
      spoken.each_with_index {|n, i| spoken_dict[n] = i; current_index = i}
      current_index += 1
      next_spoken = 0
      while current_index < limit - 1
        puts current_index  if current_index % 1000 == 0


        if spoken_dict.include? next_spoken
          next_spoken_index = spoken_dict[next_spoken]
          spoken_dict.delete(next_spoken)
          spoken_dict[next_spoken] = current_index
          next_spoken = current_index - next_spoken_index
          current_index += 1
        else
          spoken_dict[next_spoken] = current_index
          next_spoken = 0
          current_index += 1
        end
      end
      next_spoken
    end

    def part2(input)
      part1(input, 30000000)
    end
  end
end
