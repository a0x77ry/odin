# frozen_string_literal: true

# A cell of a chess` board for knight's travails problem
class Cell
  attr_accessor :edges, :path
  attr_reader :x_coord, :y_coord

  def initialize(x_coord, y_coord)
    @x_coord = x_coord
    @y_coord = y_coord
    self.edges = []
    self.path = [[x_coord, y_coord]]
  end
end
