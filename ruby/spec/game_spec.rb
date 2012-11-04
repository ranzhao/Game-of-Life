require 'spec_helper.rb'

describe Game do
  def assert_grid(init_grid, expected_grid)
      @game.cells_grid = CellsGrid.new(init_grid)
      @game.next_step.should == CellsGrid.new(expected_grid)
  end

  before :each do
    @game = Game.new()
  end

  context "Nx1" do
    it "1x1 grid" do
      assert_grid([[0]], [[0]])
      assert_grid([[1]], [[0]])
    end

    it "2x1 grid" do
      assert_grid([[0], [0]], [[0], [0]])
      assert_grid([[1], [0]], [[0], [0]])
      assert_grid([[1], [1]], [[0], [0]])
    end

    it "3x1 grid" do
      assert_grid([[0], [0], [0]], [[0], [0], [0]])
      assert_grid([[1], [0], [0]], [[0], [0], [0]])
      assert_grid([[1], [1], [0]], [[0], [0], [0]])
      assert_grid([[1], [1], [1]], [[0], [1], [0]])
    end

    it "4x1 grid" do
      assert_grid [[0], [0], [0], [0]], [[0], [0], [0], [0]]
      assert_grid [[1], [0], [0], [0]], [[0], [0], [0], [0]]
      assert_grid [[1], [1], [0], [0]], [[0], [0], [0], [0]]
      assert_grid [[1], [1], [1], [0]], [[0], [1], [0], [0]]
      assert_grid [[0], [1], [1], [1]], [[0], [0], [1], [0]]
      assert_grid [[1], [1], [1], [1]], [[0], [1], [1], [0]]
    end
  end

  context "1xN" do
    it "1x2 grid" do
      assert_grid([[0, 0]], [[0, 0]])
      assert_grid([[1, 0]], [[0, 0]])
    end

    it "1x3 grid" do
      assert_grid([[0, 0, 0]], [[0, 0, 0]])
      assert_grid([[1, 0, 0]], [[0, 0, 0]])
      assert_grid([[1, 1, 0]], [[0, 0, 0]])
      assert_grid([[1, 1, 1]], [[0, 1, 0]])
    end

    it "1x4 grid" do
      assert_grid([[0, 0, 0, 0]], [[0, 0, 0, 0]])
      assert_grid([[1, 0, 0, 0]], [[0, 0, 0, 0]])
      assert_grid([[1, 1, 0, 0]], [[0, 0, 0, 0]])
      assert_grid([[1, 1, 1, 0]], [[0, 1, 0, 0]])
      assert_grid([[1, 1, 1, 1]], [[0, 1, 1, 0]])
    end
  end

  context "MxN" do
    it "2x2 grid" do
      assert_grid([[0, 0], [0, 0]], [[0, 0], [0, 0]])
      assert_grid([[1, 0], [0, 0]], [[0, 0], [0, 0]])
      assert_grid([[1, 1], [0, 0]], [[0, 0], [0, 0]])
      assert_grid([[1, 0], [1, 0]], [[0, 0], [0, 0]])
      assert_grid([[1, 0], [0, 1]], [[0, 0], [0, 0]])
      assert_grid([[1, 1], [1, 0]], [[1, 1], [1, 1]])
    end
  end
end
