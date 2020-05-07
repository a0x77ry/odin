# frozen_string_literal: true

# A node class for binary tree
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def <=>(other)
    data <=> other.data
  end

  def initialize(data)
    self.data = data
    self.left = nil
    self.right = nil
  end
end
