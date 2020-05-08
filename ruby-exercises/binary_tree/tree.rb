# frozen_string_literal: true

# A class implementing a binary tree
class Tree
  require_relative 'node'
  require_relative 'height'

  def initialize(data_array)
    @root = build_tree(data_array)
  end

  def build_tree(data_array)
    data_array.uniq!
    @root = Node.new(data_array.pop)
    data_array.each { |data| insert(data) }
    return @root if balanced?(Height.new)

    rebalance!
    @root
  end

  def insert(data, root = @root)
    return Node.new(data) if root.nil?

    if data <= root.data
      root.left = insert(data, root.left)
    else
      root.right = insert(data, root.right)
    end
    root
  end

  def delete(data, root = @root)
    return nil if root.nil?

    if data < root.data
      root.left = delete(data, root.left)
    elsif data > root.data
      root.right = delete(data, root.right)
    # Case 1: No children
    elsif root.left.nil? && root.right.nil? # Implicitly if data = root.data
      root = nil
    # Case 2: One child
    elsif root.left.nil?
      root = root.right
    elsif root.right.nil?
      root = root.left
    # Case 3: Two children
    else
      right_min = find_tree_min(root.right)
      root.data = right_min.data
      root.right = delete(right_min.data, root.right)
    end
    root
  end

  def find_tree_min(root)
    nodes = []
    bst_to_sorted_array(root, nodes)
    nodes.min
  end

  def level_order(root = @root)
    return if root.nil?

    queue = []
    data_results = []
    queue.unshift(root)
    until queue.empty?
      current = queue.pop
      block_given? ? yield(current) : data_results << current.data
      queue.unshift(current.left) unless current.left.nil?
      queue.unshift(current.right) unless current.right.nil?
    end
    return data_results unless data_results.empty?
  end

  %w[pre in post].each do |prefix|
    define_method("#{prefix}order") do |results = [], root = @root, &block|
      return if root.nil?

      !block.nil? ? block.call(root) : results << root.data if __method__ == :preorder
      __send__(__method__, results, root.left, &block) unless root.left.nil?
      !block.nil? ? block.call(root) : results << root.data if __method__ == :inorder
      __send__(__method__, results, root.right, &block) unless root.right.nil?
      !block.nil? ? block.call(root) : results << root.data if __method__ == :postorder
      return results unless results.empty?
    end
  end

  def find(data, root = @root)
    return if root.nil?

    return root if data == root.data

    data <= root.data ? find(data, root.left) : find(data, root.right)
  end

  def bst_to_sorted_array(root, nodes)
    return if root.nil?

    bst_to_sorted_array(root.left, nodes)
    nodes << root
    bst_to_sorted_array(root.right, nodes)
  end

  def sorted_array_to_balanced_bst(nodes, start_index, end_index)
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2
    root = nodes[mid_index]
    root.left = sorted_array_to_balanced_bst(nodes, start_index, mid_index - 1)
    root.right = sorted_array_to_balanced_bst(nodes, mid_index + 1, end_index)
    root
  end

  def rebalance!
    sorted_arr = []
    bst_to_sorted_array(@root, sorted_arr)
    @root = sorted_array_to_balanced_bst(sorted_arr, 0, sorted_arr.length - 1)
  end

  def balanced?(height, root = @root)
    return true if root.nil?

    left_height = Height.new
    right_height = Height.new

    left_balanced = balanced?(left_height, root.left)
    right_balanced = balanced?(right_height, root.right)

    lh = left_height.height
    rh = right_height.height

    height.height = [lh, rh].max + 1
    return left_balanced && right_balanced if (lh - rh).abs <= 1

    false
  end

  def depth(root = @root)
    return 0 if root.nil?

    [depth(root.left), depth(root.right)].max + 1
  end
end
