require 'spec_helper.rb'

def assert_stage(original, expected)
  game = Game.new original
  game.next_stage.should == expected
end

describe Game do
  it "1x1 cells" do
    assert_stage [[0]], [[0]]
    assert_stage [[1]], [[0]]
  end

  it "2x1 cells" do
    assert_stage [[0], [0]], [[0], [0]]
    assert_stage [[1], [0]], [[0], [0]]
    assert_stage [[1], [1]], [[0], [0]]
  end

  it "3x1 cells" do
    assert_stage [[0], [0], [0]], [[0], [0], [0]]
    assert_stage [[1], [0], [0]], [[0], [0], [0]]
    assert_stage [[1], [1], [0]], [[0], [0], [0]]
    assert_stage [[1], [1], [1]], [[0], [1], [0]]
  end

  it "4x1 cells" do
    assert_stage [[0], [0], [0], [0]], [[0], [0], [0], [0]]
    assert_stage [[1], [0], [0], [0]], [[0], [0], [0], [0]]
    assert_stage [[1], [1], [0], [0]], [[0], [0], [0], [0]]
    assert_stage [[1], [1], [1], [0]], [[0], [1], [0], [0]]
    assert_stage [[0], [1], [1], [1]], [[0], [0], [1], [0]]
    assert_stage [[1], [1], [1], [1]], [[0], [1], [1], [0]]

  end

  it "1x2 cells" do
    assert_stage [[0, 0]], [[0, 0]]
    assert_stage [[1, 0]], [[0, 0]]
    assert_stage [[1, 1]], [[0, 0]]
  end

  it "1x3 cells" do
    assert_stage [[0, 0, 0]], [[0, 0, 0]]
    assert_stage [[1, 0, 0]], [[0, 0, 0]]
    assert_stage [[1, 1, 0]], [[0, 0, 0]]
    assert_stage [[1, 1, 1]], [[0, 1, 0]]
  end

  it "1x4 cells" do
    assert_stage [[0, 0, 0, 0]], [[0, 0, 0, 0]]
    assert_stage [[1, 0, 0, 0]], [[0, 0, 0, 0]]
    assert_stage [[1, 1, 0, 0]], [[0, 0, 0, 0]]
    assert_stage [[1, 1, 1, 0]], [[0, 1, 0, 0]]
    assert_stage [[0, 1, 1, 1]], [[0, 0, 1, 0]]
    assert_stage [[1, 1, 1, 1]], [[0, 1, 1, 0]]
  end

  it "2x2 cells" do
    assert_stage [[0, 0], [0, 0]], [[0, 0], [0, 0]]
    assert_stage [[1, 0], [0, 0]], [[0, 0], [0, 0]]
    assert_stage [[1, 1], [0, 0]], [[0, 0], [0, 0]]
    assert_stage [[1, 0], [1, 0]], [[0, 0], [0, 0]]
    assert_stage [[1, 0], [0, 1]], [[0, 0], [0, 0]]
    assert_stage [[1, 1], [1, 0]], [[1, 1], [1, 1]]
    assert_stage [[1, 1], [1, 1]], [[1, 1], [1, 1]]
  end
end
