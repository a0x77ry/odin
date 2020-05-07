# frozen_string_literal: true

require_relative 'tree'

randarr = Array.new(15) { rand(1..100) }
tree = Tree.new(randarr)

puts "Is the tree balanced? #{tree.balanced?(Height.new)}"
puts "\nLevel Order Elements: "
tree.level_order { |node| puts node.data.to_s }
puts "\n\n"
puts "\npreorder Elements: "
tree.preorder { |node| puts node.data.to_s }
puts "\npreorder elements without a block"
puts tree.preorder.to_s
puts "\n\n"
puts "\ninorder Elements: "
tree.inorder { |node| puts node.data.to_s }
puts "\ninorder elements without a block"
puts tree.inorder.to_s
