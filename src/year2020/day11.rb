#https://github.com/andersondias/conway-game-of-life-ruby/
module Year2020
  class Cell
    OCCUPIED = "#"
    EMPTY = "L"
    FLOOR = "."
    attr_reader :world, :x, :y, :state
    def initialize(world, x, y, state)
      @world, @x, @y = world, x, y
      @state = state
      @live = false
    end

    def floor?
      @state == FLOOR
    end

    def empty?
      @state == EMPTY
    end

    def occupied?
      @state == OCCUPIED
    end

    def toggle!
      if occupied?
        @state = EMPTY
      elsif empty?
        @state = OCCUPIED
      end
    end

    def neighbours
      neighbours = []
      neighbours.push(@world.cell_at(self.x - 1, self.y - 1))
      neighbours.push(@world.cell_at(self.x - 1, self.y))
      neighbours.push(@world.cell_at(self.x - 1, self.y + 1))

      neighbours.push(@world.cell_at(self.x, self.y - 1))
      neighbours.push(@world.cell_at(self.x, self.y + 1))

      neighbours.push(@world.cell_at(self.x + 1, self.y - 1))
      neighbours.push(@world.cell_at(self.x + 1, self.y))
      neighbours.push(@world.cell_at(self.x + 1, self.y + 1))

      neighbours
    end

    def occupied_neighbours
      self.neighbours.select do |n|
        n && n.occupied?
      end
    end

    def ==(o)
      o.state == state
    end

    def inspect
      @state
    end
    def to_s
      @state
    end
  end

  class World
    def initialize(input)
      height = input.length
      width = input[0].length
      p height, width
      @cells = []
      height.times do |x|
        @cells.push([])
        width.times do |y|
          @cells[x].push(Cell.new(self, x, y, input[x][y]))
        end
      end
    end

    def cells
      @cells.flatten
    end

    def display
      @cells.each do |row|
        row.each do |entry|
          print entry
        end
        print "\n"
      end
      puts  "------------------------"
    end

    def count(c="#")
      total = 0
      @cells.each do |row|
        row.each do |entry|
          total += 1 if entry.state == c
        end
      end
      total
    end


    def cell_at(x, y)
      return nil if x < 0 || y < 0
      if @cells[x]
        @cells[x][y]
      end
    end

    def next_generation!
      affected = []
      cells.each do |cell|
        if(cell.empty? && cell.occupied_neighbours.length == 0)
          affected.push cell
        elsif(cell.occupied? && cell.occupied_neighbours.length >= 4)
          affected.push cell
        end
      end
      affected.each(&:toggle!)
      return
    end
  end

  class Day11

    def transform_input(input)
      input.lines.map(&:strip).each.map(&:chars)
    end

    def part1(input)
      input = transform_input(input)
      world = World.new(input)
      last_gen = ""
      while last_gen !=  world.cells.to_s
        world.display
        last_gen = world.cells.to_s
        world.next_generation!
        puts "last_gen: #{last_gen}"
        puts "new: #{world.cells}"
        puts "result: #{last_gen ==  world.cells.to_s}"
      end
      world.count
    end

    def part2(input)
      nil
    end
  end
end
