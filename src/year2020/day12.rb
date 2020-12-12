module Year2020
  class Day12
    ROTATIONS = ['L', 'R']
    COMPASS = ['N', 'E', 'S', 'W']

    def rotate(current_direction,rotation_direction, degrees)
      direction = 1
      if rotation_direction == 'L'
        direction = -1
      end
      rotations = (degrees / 90)
      # TODO CLEANUP
      COMPASS.rotate(COMPASS.index(current_direction) + (rotations*direction))[0]
    end

    def move(direction, steps)
      case direction
      when "N"
        return 0, steps
      when "E"
        return steps, 0
      when "S"
        return 0, -steps
      when "W"
        return -steps, 0
      end
    end

    def part1(input)
      current_x = 0
      current_y = 0
      current_direction = "E"
      input.lines do |line|
        direction, number = line[0], line[1..].to_i
        if ROTATIONS.include?(direction)
          current_direction = rotate(current_direction, direction, number)
        elsif direction == "F"
          x, y = move(current_direction, number)
          current_x += x
          current_y += y
        else
          x, y = move(direction, number)
          current_x += x
          current_y += y
        end
      end
      current_x.abs + current_y.abs
    end

    #         |
    # (-x,y)  | (x,y)
    # ---------------
    # (-x,-y) | (x,-y)
    #         |
    #         |
    #
    #          |
    # (-4,10)  | (10,4)
    # ---------------
    # (-10,-4) | (4,-10)
    #          |
    def rotate_waypoint_left(waypoint_x, waypoint_y)
      if waypoint_x > 0 and waypoint_y > 0
        return -waypoint_y, waypoint_x
      elsif waypoint_x < 0 and waypoint_y > 0
        return -waypoint_y, waypoint_x
      elsif waypoint_x < 0 and waypoint_y < 0
        return -waypoint_y, waypoint_x
      elsif waypoint_x > 0 and waypoint_y < 0
        return -waypoint_y, waypoint_x
      # Handle the 0 case for one of the axis
      elsif waypoint_x == 0
        return -waypoint_y, waypoint_x
      elsif waypoint_y == 0
        return waypoint_y, waypoint_x
      else
        return waypoint_x, waypoint_y
      end
    end

    #          |
    # (-4,10)  | (10,4)
    # ---------------
    # (-10,-4) | (4,-10)
    #          |
    def rotate_waypoint_right(waypoint_x, waypoint_y)
      if waypoint_x > 0 and waypoint_y > 0
        return waypoint_y, -waypoint_x
      elsif waypoint_x > 0 and waypoint_y < 0
        return waypoint_y, -waypoint_x
      elsif waypoint_x < 0 and waypoint_y < 0
        return waypoint_y, -waypoint_x
      elsif waypoint_x < 0 and waypoint_y > 0
        return waypoint_y, -waypoint_x
      # Handle the 0 case for one of the axis
      elsif waypoint_x == 0
        return waypoint_y, waypoint_x
      elsif waypoint_y == 0
        return waypoint_y, -waypoint_x
      else
        return waypoint_x, waypoint_y
      end
    end

    def rotate_waypoint(direction, degrees, waypoint_x, waypoint_y)
      num_of_rotations = degrees / 90
      num_of_rotations.times do
        if direction == "R"
          waypoint_x, waypoint_y = rotate_waypoint_right(waypoint_x, waypoint_y)
        else
          waypoint_x, waypoint_y = rotate_waypoint_left(waypoint_x, waypoint_y)
        end
      end
      return waypoint_x, waypoint_y
    end

    def part2(input)
      waypoint_x = 10
      waypoint_y = 1
      current_x = 0
      current_y = 0
      input.lines do |line|
        direction, number = line[0], line[1..].to_i
        if ROTATIONS.include?(direction)
          waypoint_x, waypoint_y = rotate_waypoint(direction, number, waypoint_x, waypoint_y)
        elsif direction == "F"
          current_x += waypoint_x * number
          current_y += waypoint_y * number
        else
          x, y = move(direction, number)
          waypoint_x += x
          waypoint_y += y
        end
      end
      current_x.abs + current_y.abs
    end
  end
end
