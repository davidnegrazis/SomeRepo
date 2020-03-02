Point = Struct.new(:x_pos, :y_pos) do
  def manhattan_distance(other)
    (other.x_pos - self.x_pos).abs + (other.y_pos - self.y_pos).abs
  end
end

def add_direction_movement(cur_point, dir)
  x = cur_point.x_pos
  y = cur_point.y_pos

  case dir
  when 'R'
    Point.new(x + 1, y)
  when 'L'
    Point.new(x - 1, y)
  when 'U'
    Point.new(x, y + 1)
  when 'D'
    Point.new(x, y - 1)
  else
    raise "Invalid direction code '" + dir + "'"
  end
end

def create_points_arr(input)
  coords = [Point.new(0, 0)]

  input.split(',').each do |instr|
    dir = instr[0]
    num_times = instr[1..-1].to_i

    num_times.times do
      coords << add_direction_movement(coords[-1], dir)
    end
  end

  coords.shift  # remove origin
  coords
end

def closest_intersection_distance(input0, input1)
  intersections = (create_points_arr(input0) & create_points_arr(input1)).uniq
  shortest_dist = Float::INFINITY

  intersections.each do |p|
    dist = p.manhattan_distance(Point.new(0, 0))
    shortest_dist = dist if dist < shortest_dist
  end

  shortest_dist
end

def hello_world
  puts "Hello world"
end