module Year2020
  class Day14
    def part1(input)
      bitmask, and_bitmask, or_bitmask = nil, nil, nil
      result = {}
      input.lines do |line|
        if line.match?(/mask/)
          bitmask = line.split('= ').last
          and_bitmask = bitmask.gsub('X', '1').to_i(2)
          or_bitmask = bitmask.gsub('X', '0').to_i(2)
        else
          address, value = line.match(/(\d+)\] = (\d+)/).captures
          result[address] = value.to_i & and_bitmask | or_bitmask
        end
      end
      result.values.sum
    end

    def part2(input)
      bitmask = nil
      result = {}
      input.lines do |line|
        if line.match?(/mask/)
          bitmask = line.split('= ').last
        else
          address, value = line.match(/(\d+)\] = (\d+)/).captures
          address_binary =  address.to_i.to_s(2).rjust(36, "0")
          mask_applied = ''
          address_binary.chars.zip(bitmask.chars) do |a,b|
            b == '0' ? mask_applied << a : mask_applied << b
          end
          num_of_x = mask_applied.count('X')
          ['0', '1'].repeated_permutation(num_of_x) do |permutation|
            current = mask_applied.clone
            permutation.each do |char|
              current.sub!('X', char)
            end
            result[current.to_i(2)] = value.to_i
          end
        end
      end
      result.values.sum
    end
  end
end
