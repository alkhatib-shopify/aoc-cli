module Year2020
  class Day08
    class Instruction
      attr_accessor :operation, :argument
      def initialize(line)
        @operation, @argument = line.strip.split
        @argument = @argument.to_i
      end

      def to_s
        "#@operation #@argument"
      end
    end

    def run_code(instructions)
      accumulator = 0
      executed = Set.new
      instruction_index = 0
      while not executed.include?(instruction_index)
        executed << instruction_index
        instruction = instructions[instruction_index]
        if instruction.nil?
          puts "NIL: #{accumulator}"
        end
        #puts instruction_index, instruction
        case instruction.operation
        when "acc"
          accumulator += instruction.argument
          instruction_index += 1
        when "nop"
          instruction_index += 1
        when "jmp"
          instruction_index += instruction.argument
        end
      end
      accumulator
    end

    def part1(input)
      instructions = {}
      input.each_line.with_index do |line, index|
        instruction = Instruction.new(line)
        instructions[index] = instruction
      end
      run_code(instructions)
    end


    def part2(input)
      jmp_instructions = []
      nop_instructions = []
      instructions = {}
      input.each_line.with_index do |line, index|
        instruction = Instruction.new(line)
        instructions[index] = instruction
        jmp_instructions << index if instruction.operation == "jmp"
        nop_instructions << index if instruction.operation == "nop"
      end
      jmp_instructions.each do |jmp_index|
        puts "jmp"
        puts jmp_index
        instructions[jmp_index].operation = "nop"
        run_code(instructions)
        instructions[jmp_index].operation = "jmp"
      end
      nop_instructions.each do |nop_index|
        instructions[nop_index].operation = "jmp"
        run_code(instructions)
        instructions[nop_index].operation = "nop"
      end
      run_code(instructions)
    end
  end
end
