require 'facets/range/combine'
module Year2020
  class Day16
    def part1(input)
      rules, my_ticket, nearby_tickets = input.split("\n\n")
      rule_dict = {}
      rules.lines[0..].each do |rule|
        rule_name, ranges = rule.split(':')
        range_1, range_2 = ranges.split('or')
        range_1_start, range_1_end = range_1.split('-').map(&:to_i)
        range_2_start, range_2_end = range_2.split('-').map(&:to_i)
        rule_dict[rule_name] = [(range_1_start..range_1_end), (range_2_start..range_2_end)]
      end
      total_error = 0
      combined_ranges =  Range.combine(*rule_dict.values.flatten)
      nearby_tickets.lines[1..].each do |ticket|
        total_error += ticket.split(',').map(&:to_i).filter do |x|
          !combined_ranges.any? {|r| r.cover? x }
        end.sum
      end
      total_error
    end

    def part2(input)
      rules, my_ticket, nearby_tickets = input.split("\n\n")
      rule_dict = {}
      rules.lines[0..].each do |rule|
        rule_name, ranges = rule.split(':')
        range_1, range_2 = ranges.split('or')
        range_1_start, range_1_end = range_1.split('-').map(&:to_i)
        range_2_start, range_2_end = range_2.split('-').map(&:to_i)
        rule_dict[rule_name] = [(range_1_start..range_1_end), (range_2_start..range_2_end)]
      end
      total_error = 0
      combined_ranges =  Range.combine(*rule_dict.values.flatten)
      valid_tickets = nearby_tickets.lines[1..].filter do |ticket|
        ticket.split(',').map(&:to_i).all? do |x|
          combined_ranges.any? {|r| r.cover? x }
        end
      end

      possible = {
        0 => Set.new(rule_dict.keys),
        1 => Set.new(rule_dict.keys),
        2 => Set.new(rule_dict.keys),
        3 => Set.new(rule_dict.keys),
        4 => Set.new(rule_dict.keys),
        5 => Set.new(rule_dict.keys),
        6 => Set.new(rule_dict.keys),
        7 => Set.new(rule_dict.keys),
        8 => Set.new(rule_dict.keys),
        9 => Set.new(rule_dict.keys),
        10 => Set.new(rule_dict.keys),
        11 => Set.new(rule_dict.keys),
        12 => Set.new(rule_dict.keys),
        13 => Set.new(rule_dict.keys),
        14 => Set.new(rule_dict.keys),
        15 => Set.new(rule_dict.keys),
        16 => Set.new(rule_dict.keys),
        17 => Set.new(rule_dict.keys),
        18 => Set.new(rule_dict.keys),
        19 => Set.new(rule_dict.keys),
      }
      #puts possible






      result = valid_tickets.filter do |ticket|
        ticket.split(',').map(&:to_i).each_with_index.all? do |x, i|
          rule_dict.each do |key, ranges|
            if not ranges.any? {|r| r.cover? x}
              possible[i].delete(key)
            end
          end
        end
      end
      20.times do 
        possible.each do |k,v|
          puts k, v # unless [0,1,2,3,5,6,7,8,9,10,12,13,14,15,19,4].include? k
          v.delete("zone") unless k == 0
          v.delete("train") unless k == 3
          v.delete("arrival track") unless k == 3

          v.delete("departure track") unless k == 5
          v.delete("arrival station") unless k == 6
          v.delete("seat") unless k == 7

          v.delete("price") unless k == 8
          v.delete("wagon") unless k == 9
          v.delete("route") unless k == 10

          v.delete("row") unless k == 12
          v.delete("class") unless k == 14

          v.delete("departure location") unless k == 13
          v.delete("departure time") unless k == 1
          v.delete("departure platform") unless k == 2
          v.delete("departure date") unless k == 15
          v.delete("departure station") unless k == 19
        end
        puts "-=-=-=-=-=-"
        puts my_ticket.split(':').last.split(',').each_with_index {|x,i| puts x if [13,1,2,15,19,5].include? i}
      end

      nil
    end
  end
end
