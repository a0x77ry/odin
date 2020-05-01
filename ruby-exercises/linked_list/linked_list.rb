# frozen_string_literal: true

# A linked list class
class LinkedList
  include Enumerable
  require_relative 'node'

  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def each
    return nil if @head.nil?

    node = @head
    until node.nil?
      yield(node)
      node = node.next
    end
  end

  def each_with_index
    return nil if @head.nil?

    node = @head
    index = 0
    until node.nil?
      yield(node, index)
      index += 1
      node = node.next
    end
  end

  def append(value)
    node = Node.new(value)
    @head.nil? ? @head = node : @tail.next = node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    head.nil? ? @tail = node : node.next = head
    @head = node
  end

  def size
    each_with_index { |node, index| return index + 1 if node.next.nil? }
  end

  def at(index)
    each_with_index { |node, i| return node if i == index }
    nil
  end

  def pop
    result = nil
    each do |node|
      next unless node.next == tail

      node.next = nil
      result = tail
      @tail = node
    end
    result
  end

  def contains?(value)
    each { |node| return true if node.data == value }
    false
  end

  def find(value)
    each_with_index { |node, index| return index if node.data == value }
    nil
  end

  def to_s
    each { |node| print "( #{node.data} ) -> " }
    print 'nil'
  end

  def insert_at(value, index)
    return unless index.positive? && index < size - 1

    inserted_node = Node.new(value)
    inserted_node.next = at(index)
    at(index - 1).next = inserted_node
  end

  def remove_at(index)
    prev_node = at(index - 1)
    next_node = at(index + 1)
    if !prev_node.nil?
      prev_node.next = next_node
      @tail = prev_node if next_node.nil?
    else
      @head = next_node unless next_node.nil?
    end
  end
end
