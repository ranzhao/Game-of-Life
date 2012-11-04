class CellsGrid
  $PADDING_OFFSET = 1;
  $PADDING_SIZE = 2 * $PADDING_OFFSET;

  attr_reader :padded_array, :y_size, :x_size

  def initialize(array)
    init_size(array)
    init_grid(array)
  end

  def ==(cells_grid)
    @padded_array == cells_grid.padded_array
  end

  def set_alive(y, x)
    @padded_array[y + $PADDING_OFFSET][x + $PADDING_OFFSET] = 1
  end

  def alive?(y, x)
    @padded_array[y + $PADDING_OFFSET][x + $PADDING_OFFSET] == 1
  end

  def has_2_alive_neighbors?(y, x)
    alive_neighbors(y, x) == 2
  end

  def has_3_alive_neighbors?(y, x)
    alive_neighbors(y, x) == 3
  end

private
  def init_size(grid)
    @y_size = grid.size
    @x_size = grid[0].size
  end

  def init_grid(grid)
    @padded_array = Array.new(@y_size + $PADDING_SIZE){Array.new(@x_size + $PADDING_SIZE, 0)}

    for y in 0...@y_size
      for x in 0...@x_size
        @padded_array[y + $PADDING_OFFSET][x + $PADDING_OFFSET] = grid[y][x]
      end
    end
  end

  def alive_neighbors(y, x)
    count = 0
    count += 1 if up_alive?(y, x)
    count += 1 if down_alive?(y, x)
    count += 1 if left_alive?(y, x)
    count += 1 if right_alive?(y, x)
    count += 1 if up_left_alive?(y, x)
    count += 1 if up_right_alive?(y, x)
    count += 1 if down_left_alive?(y, x)
    count += 1 if down_right_alive?(y, x)
    count
   end

  def up_alive?(y, x)
    alive?(y - 1, x)
  end

  def down_alive?(y, x)
    alive?(y + 1, x)
  end

  def left_alive?(y, x)
    alive?(y, x - 1)
  end

  def right_alive?(y, x)
    alive?(y, x + 1)
  end

  def up_left_alive?(y, x)
    alive?(y - 1, x - 1)
  end

  def up_right_alive?(y, x)
    alive?(y - 1, x + 1)
  end

  def down_left_alive?(y, x)
    alive?(y + 1, x - 1)
  end

  def down_right_alive?(y, x)
    alive?(y + 1, x + 1)
  end
end
