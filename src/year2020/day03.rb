module Year2020
  class Day03
    def calculate(input, step_row, step_col)
      input = input.each_with_index.select{|x,i| i % step_row == 0}.map(&:first)
      columns = input[0].strip.size
      start_x = 0
      input.count do |line|
        c_start_x = start_x
        start_x += step_col
        start_x = start_x % columns
        line[c_start_x] == "#"
      end
    end

    def part1(input)
      calculate(input.lines, 1, 3)
    end


    def part2(input)
      a = calculate(input.lines, 1, 1)
      a *= calculate(input.lines, 1, 3)
      a *= calculate(input.lines, 1, 5)
      a *= calculate(input.lines, 1, 7)
      a *= calculate(input.lines, 2, 1)
    end
  end
end
