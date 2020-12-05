require 'byebug'
module Year2020
  class Day04
    def extract_entries(input)
      input.split(/^\n/).map(&:strip)
    end

    def hash_from(input)
      input.split.map do |entry|
        key, value = entry.split(':')
        [key.to_sym, value]
      end.to_h
    end

    def hgt_valid?(hgt)
      height, unit = hgt.split(/(in|cm)/)
      height = height.to_i
      case unit
      when 'cm'
        height.between?(150,193)
      when 'in'
        height.between?(59,76)
      else
        false
      end
    end

    def valid?(entry)
      ([:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid] - entry.keys).empty?
    end


    def valid2?(entry)
      ([:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid] - entry.keys).empty? &&
        entry[:byr].to_i.between?(1920,2002) &&
        entry[:iyr].to_i.between?(2010,2020) &&
        entry[:eyr].to_i.between?(2020,2030) &&
        hgt_valid?(entry[:hgt]) &&
        entry[:hcl].match(/#\h{6}/) &&
        %w(amb blu brn gry grn hzl oth).include?(entry[:ecl]) &&
        entry[:pid].match(/^\d{9}$/)  # This was previously /\d{9}/ and matched 1234567890 which has 9 digits + 1
    end

    def part1(input)
      input = extract_entries(input)
      input = input.map {|entry| hash_from(entry)}
      input.filter {|hash| valid?(hash) }.count
    end

    def part2(input)
      input = extract_entries(input)
      input = input.map {|entry| hash_from(entry)}
      input.filter {|hash| valid2?(hash) }.length
    end
  end
end
