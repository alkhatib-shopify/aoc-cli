require 'spec_helper'

RSpec.describe Year2020::Day01 do
  it "solves part1" do
    d = Year2020::Day01.new
    expect(d.part1("1721\n979\n366\n299\n675\n1456")).to eq(514579)
  end

  it "solves part2" do
    d = Year2020::Day01.new
    expect(d.part2("1721\n979\n366\n299\n675\n1456")).to eq(241861950)
  end
end
