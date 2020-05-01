# frozen_string_literal: true

# A node class for a linked list
class Node
  attr_accessor :next, :data

  def initialize(data)
    self.next = nil
    self.data = data
  end
end
