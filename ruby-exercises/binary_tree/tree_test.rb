# frozen_string_literal: true

require_relative 'tree'

%w[pre in post].each do |prefix|
  define_method("show_#{prefix}order") do |tree|
    puts "\n\n"
    puts "\nElements #{prefix}order: "
    meth = "#{prefix}order".to_sym
    tree.__send__(meth) { |node| puts node.data.to_s }
    puts "\nPrint #{prefix}order elements without a block: "
    puts tree.__send__(meth).to_s
  end
end

randarr = Array.new(15) { rand(1..100) }
tree = Tree.new(randarr)

puts "Is the tree balanced? #{tree.balanced?(Height.new)}"
puts "\nElements in level order: "
tree.level_order { |node| puts node.data.to_s }

show_preorder(tree)
show_inorder(tree)
show_postorder(tree)

puts "\n\nInserting some big numbers to the tree"
big_nums = Array.new(10) { rand(100..200) }
big_nums.each do |num|
  puts "Inserting #{num}"
  tree.insert(num)
end
puts "Is the tree now balanced? #{tree.balanced?(Height.new)}"

puts "\n\nRebalancing the tree..."
tree.rebalance!
puts "Now things should be fixed. Right? #{tree.balanced?(Height.new)}"

show_preorder(tree)
show_inorder(tree)
show_postorder(tree)
