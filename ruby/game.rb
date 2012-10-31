class Game
  def initialize(cells)
    @cells = cells
    @y_size = cells.size
    @x_size = cells[0].size
  end

  def next_stage
    new_cells = @y_size.times.map {[0] * @x_size}

    if @x_size >= 3 || @y_size >= 3
      @y_size.times do |y|
        @x_size.times do |x| 
          if is_alive(y, x) && has_2_alive_neighborss(y, x)
            new_cells[y, x] = [1]
          end
        end
      end
    end
  
    return new_cells
  end

  def is_alive(y, x)
    @cells[y][x] == 1
  end

  def up_is_alive(y, x)
    y > 0 && is_alive(y - 1, x)
  end

  def down_is_alive(y, x)
    y < @y_size - 1 && is_alive(y + 1, x)
  end

  def left_is_alive(y, x)
    x > 0 && is_alive(y, x - 1)
  end

  def right_is_alive(y, x)
    x < @x_size - 1 && is_alive(y, x + 1)
  end

  def has_2_alive_neighborss(y, x)
    alive_neighbors = 0
    alive_neighbors++ if up_is_alive(y, x) 
    alive_neighbors++ if down_is_alive(y, x) 
    alive_neighbors++ if left_is_alive(y, x) 
    alive_neighbors++ if right_is_alive(y, x)
  end

end
