module Year2020
  class Day02
    def part1(input)
      input = input.lines.map(&:split)
      matching = input.filter do |range, letter, password|
        lower, upper = range.split('-').map(&:to_i)
        letter = letter[0]
        count = password.chars.tally[letter]
        count.between?(lower, upper) if count
      end
      matching.size
    end

    def part2(input)
      input = input.lines.map(&:split)
      matching = input.filter do |range, letter, password|
        lower, upper = range.split('-').map(&:to_i)
        lower = lower - 1
        upper = upper - 1
        letter = letter[0]
        (letter == password[lower]) ^ (letter == password[upper])
      end
      matching.size
    end
  end
end
