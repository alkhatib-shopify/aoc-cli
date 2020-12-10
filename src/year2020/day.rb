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
    def depth_first_search(adj_matrix, source_index, end_index)
      node_stack = [source_index]
      p node_stack

      loop do
        curr_node = node_stack.pop
        p curr_node
        return false if curr_node == nil
        return true if curr_node == end_index

        children = (0..adj_matrix.length-1).to_a.select do |i|
          adj_matrix[curr_node][i] == 1
        end

        node_stack = node_stack + children
      end
    end

    def part2(input)
      input = input.lines.map(&:to_i).sort
      input.prepend(0)
      input.append(input.max+3)
      adjacency_matrix = Array.new(input.length) { Array.new(input.length, 0)}
      p adjacency_matrix
      input.each_with_index do |source, index|
        adjacency_matrix[index][index+1] = 1 if input[index+1] && (input[index+1] - input[index]).between?(1,3)
        adjacency_matrix[index][index+2] = 1 if input[index+2] && (input[index+2] - input[index]).between?(1,3)
        adjacency_matrix[index][index+3] = 1 if input[index+3] && (input[index+3] - input[index]).between?(1,3)
      end
      p adjacency_matrix
      p depth_first_search(adjacency_matrix, 0, input.length - 1)
      nil
    end
  end
end
