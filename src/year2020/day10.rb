module Year2020
  class Day10
    def initialize
      @memo = {}
    end
    def part1(input)
      input = input.lines.map(&:to_i).sort
      input.prepend(0)
      input.append(input.max+3)
      counts = input.each_cons(2).map {|a,b| b-a }.tally
      counts[1] * counts[3]
    end

    def dynamic_count(node, input, adjacency_list)
      if node == input.last
        return 1
      elsif @memo.has_key? node
        return @memo[node]
      end
      total = 0
      adjacency_list[node].each do |a|
        total += dynamic_count(a, input, adjacency_list)
      end
      @memo[node] = total
      total
    end

    def part2(input)
      input = input.lines.map(&:to_i).sort
      input.prepend(0)
      input.append(input.max+3)
      adjacency_list = Hash.new {|hash,key| hash[key] = []}
      input.each_with_index do |source, index|
        adjacency_list[source] = input.slice(index+1, 3).take_while {|n| n && (n - source).between?(1,3)}
      end
      dynamic_count(input.first, input, adjacency_list)
      @memo[0]
    end
  end
end
