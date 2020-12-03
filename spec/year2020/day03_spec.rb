require 'spec_helper'

RSpec.describe Year2020::Day03 do
  it "solves part1" do
    d = Year2020::Day03.new
    some_input = """..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#"""
    expect(d.part1(some_input)).to eq(7)
  end

  it "solves part2" do
    d = Year2020::Day03.new
    some_input = """..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#"""
    expect(d.calculate(some_input.lines, 1, 1)).to eq(2)
    expect(d.calculate(some_input.lines, 1, 3)).to eq(7)
    expect(d.calculate(some_input.lines, 1, 5)).to eq(3)
    expect(d.calculate(some_input.lines, 1, 7)).to eq(4)
    expect(d.calculate(some_input.lines, 2, 1)).to eq(2)
    expect(d.part2(some_input)).to eq(336)
  end

  it "handles row increment other than 1" do
    d = Year2020::Day03.new
    some_input = """######
######
######
######
######
######
######
    """
    expect(d.calculate(some_input.lines, 1, 1)).to eq(7)
    expect(d.calculate(some_input.lines, 2, 1)).to eq(4)
    expect(d.calculate(some_input.lines, 3, 1)).to eq(3)
    expect(d.calculate(some_input.lines, 4, 1)).to eq(2)
    expect(d.calculate(some_input.lines, 5, 1)).to eq(2)
    expect(d.calculate(some_input.lines, 6, 1)).to eq(2)
    expect(d.calculate(some_input.lines, 7, 1)).to eq(1)

  end
end
