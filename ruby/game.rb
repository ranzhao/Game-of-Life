require_relative 'cells_grid.rb'

class Game
  attr_accessor :cells_grid

  def next_step
    empty_grid = cells_grid.y_size.times.map {[0] * cells_grid.x_size}
    @new_cells_grid = CellsGrid.new(empty_grid)

    cells_grid.y_size.times do |y|
      cells_grid.x_size.times do |x|
        @new_cells_grid.set_alive(y, x) if should_revive?(y, x)
      end
    end

    @cells_grid = @new_cells_grid
  end

  def should_revive?(y, x)
    @cells_grid.has_3_alive_neighbors?(y, x) ||
    (@cells_grid.alive?(y, x) && @cells_grid.has_2_alive_neighbors?(y, x))
  end
end
