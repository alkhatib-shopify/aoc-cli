require 'spec_helper'

RSpec.describe Year2020::Day12 do
  it "solves part1" do
    d = Year2020::Day12.new
    some_input = """F10
N3
F7
R90
F11
L180
R270"""
    expect(d.part1(some_input)).to eq(25)
  end

  it "solves part2" do
    d = Year2020::Day12.new
    some_input = """F10
N3
F7
R90
F11"""
    expect(d.part2(some_input)).to eq(286)
  end
end
