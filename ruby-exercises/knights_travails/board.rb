# frozen_string_literal: true

# A chess board
class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, nil) }
  end
end
