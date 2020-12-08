require 'rgl/adjacency'
require 'rgl/dijkstra'
require 'rgl/traversal'
require 'rgl/topsort'

require 'rgl/dot'
module Year2020

  class Day07
    def part1(input)
      input.gsub!(/[ ]?bag[s]?|\./, "")
      graph = RGL::DirectedAdjacencyGraph.new
      input.lines.each do |line|
        if line.match?(/no other/)
          graph.add_vertex(line.split.take(2).join(' ').strip)
        else
          container, contains  = line.split('contain')
          container = container.strip
          contains = contains.strip.split(',').map(&:strip)
          contains.each do |contained|
            graph.add_edge(contained.split.last(2).join(' '), container)
          end

        end
      end
      graph.write_to_graphic_file('jpg')
      puts graph.bfs_search_tree_from("shiny gold").size - 1
    end

    def part2(input)
      puts "=-=--=-=-=-=-=-=-=-"
      input.gsub!(/[ ]?bag[s]?|\./, "")
      graph = RGL::DirectedAdjacencyGraph.new
      edge_weights = {}
      input.lines.each do |line|
        if line.match?(/no other/)
          graph.add_vertex(line.split.take(2).join(' ').strip)
        else
          container, contains  = line.split('contain')
          container = container.strip
          contains = contains.strip.split(',').map(&:strip)
          contains.each do |contained|
            graph.add_edge(container, contained.split.last(2).join(' '))
            #p [contained.split.last(2).join(' '), container] , contained.split.first.to_i
            edge_weights[ [container, contained.split.last(2).join(' ')]] = contained.split.first.to_i
          end

        end
      end
      graph.write_to_graphic_file('jpg')
     #  puts edge_weights
     #  bfs = graph.bfs_iterator("shiny gold")
     #  s = Hash.new(0)
     #  s["shiny gold"] = 1
     #  ## 2 + (4) + (8) + (16) + (32) + (64)
     #  ## 2 + (4) + (8) + (16) + (32) + (64)
     #  #1 + 2 + 1*7 + 2*11
     #  total = 0
     #  node_total = 0
     #  bfs.set_examine_edge_event_handler { |u, v|
     #    puts "edge #{u} #{v}"
     #    puts "edge w #{edge_weights[[u,v]]}"
     #    node_total +=  edge_weights[[u,v]]
     #    #puts "node_total #{node_total}"
     #    s[v] = edge_weights[[u,v]]
     #    #puts "s: #{s}"
     #  }
     # previous_total =1
     #  while not bfs.at_end?
     #    bfs.basic_forward
     #    puts "total: #{total} +=  node_total:#{node_total} * previous_total:#{previous_total}"
     #    total +=  node_total * previous_total
     #    previous_total = node_total * previous_total
     #    puts "previous_total:#{previous_total}"
     #    node_total = 0
     #  end
     #  puts total
      dfs = graph.dfs_iterator("shiny gold")
      dfs.set_examine_edge_event_handler { |u, v|
        p [u,v]
      }
      dfs.basic_forward
      dfs.basic_forward
      dfs.basic_forward
    end
  end
end
