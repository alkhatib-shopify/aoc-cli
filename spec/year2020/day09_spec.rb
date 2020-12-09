require 'spec_helper'

RSpec.describe Year2020::Day09 do
  it "solves part1" do
    d = Year2020::Day09.new
    some_input = """35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576"""
    expect(d.part1(some_input)).to eq(127)
  end

  it "solves part2" do
    d = Year2020::Day09.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
