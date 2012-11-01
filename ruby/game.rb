class Game
  def initialize(cells)
    @cells = cells
    @y_size = cells.size
    @x_size = cells[0].size
  end

  def next_stage
    new_cells = @y_size.times.map {[0] * @x_size}

    @y_size.times do |y|
      @x_size.times do |x| 
        if cell_alive?(y, x) && has_2_alive_neighbors?(y, x)
          set_alive(new_cells, y, x)
        end
      end
    end
  
    return new_cells
  end

  def set_alive(cells, y, x)
    cells[y][x] = 1
  end

  def cell_alive?(y, x)
    @cells[y][x] == 1
  end

  def up_cell_alive?(y, x)
    y > 0 && cell_alive?(y - 1, x)
  end

  def down_cell_alive?(y, x)
    y < @y_size - 1 && cell_alive?(y + 1, x)
  end

  def left_cell_alive?(y, x)
    x > 0 && cell_alive?(y, x - 1)
  end

  def right_cell_alive?(y, x)
    x < @x_size - 1 && cell_alive?(y, x + 1)
  end

  def alive_neighbors(y, x)
    alive_neighbors = 0
    alive_neighbors += 1 if up_cell_alive?(y, x) 
    alive_neighbors += 1 if down_cell_alive?(y, x) 
    alive_neighbors += 1 if left_cell_alive?(y, x) 
    alive_neighbors += 1 if right_cell_alive?(y, x)
    alive_neighbors
 end

  def has_2_alive_neighbors?(y, x)
    alive_neighbors(y, x) == 2
  end

end
