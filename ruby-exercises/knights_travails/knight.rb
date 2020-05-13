# frozen_string_literal: true

# A chess' knight class
class Knight
  require_relative 'board'
  require_relative 'cell'

  N_LEGAL_RELATIVE_MOVES = [[-2, 1], [-1, 2], [1, 2], [2, 1],
                            [2, -1], [1, -2], [-1, -2], [-2, -1]].freeze

  def initialize(init_pos)
    @init_pos = init_pos
    @board = Board.new.board
    @root = build_tree(init_pos)
  end

  def knight_moves(to_pos)
    target_cell = @board[to_pos[0]][to_pos[1]]
    return if target_cell.nil?

    target_cell.path
    puts "You made it in #{target_cell.path.length - 1} moves!"
    puts 'Your path is: '
    p target_cell.path
  end

  private

  def build_tree(from_pos, board = @board)
    starting_cell = Cell.new(from_pos[0], from_pos[1])
    queue = []
    queue.unshift(starting_cell)
    until queue.empty?
      current = queue.pop
      possible_moves = find_possible_moves([current.x_coord, current.y_coord])
      next if possible_moves.nil?

      possible_moves.each_with_index do |move, i|
        next unless board[move[0]][move[1]].nil?

        linked_cell = Cell.new(move[0], move[1])
        current.edges[i] = linked_cell
        linked_cell.path = current.path + linked_cell.path
        board[move[0]][move[1]] = linked_cell
        queue.unshift(linked_cell)
      end
    end
    starting_cell
  end

  def in_bounds?(pos)
    return false unless (0..7).include?(pos[0]) && (0..7).include?(pos[1])

    true
  end

  def find_possible_moves(pos)
    moves = N_LEGAL_RELATIVE_MOVES
            .collect { |item| [pos[0] + item[0], pos[1] + item[1]] }
    moves.select! { |item| in_bounds?(item) }
    moves
  end
end
