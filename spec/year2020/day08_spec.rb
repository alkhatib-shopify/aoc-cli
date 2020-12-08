require 'spec_helper'

RSpec.describe Year2020::Day08 do
  it "reads nop line and converts to Instruction class" do
    input = "nop +0\n"
    instruction = Year2020::Day08::Instruction.new(input)
    expect(instruction.operation).to eq('nop')
    expect(instruction.argument).to eq(0)
  end

  it "reads acc line and converts to Instruction class" do
    input = "acc +1\n"
    instruction = Year2020::Day08::Instruction.new(input)
    expect(instruction.operation).to eq('acc')
    expect(instruction.argument).to eq(1)
  end

  it "reads jmp line and converts to Instruction class" do
    input = "jmp -4\n"
    instruction = Year2020::Day08::Instruction.new(input)
    expect(instruction.operation).to eq('jmp')
    expect(instruction.argument).to eq(-4)
  end

  it "solves part1" do
    skip
    d = Year2020::Day08.new
    some_input = """nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6"""
    expect(d.part1(some_input)).to eq(5)
  end

  it "solves part2" do
    d = Year2020::Day08.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
