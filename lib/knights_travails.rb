require 'pry-byebug'

class Node
  attr_accessor :data, :children

  def initialize(data = nil)
    @data = data
    @children = []
  end
end

class Tree
  attr_reader :given_node, :root
  attr_accessor :children

  def initialize(start, finish)
    @root = Node.new(start)
    @given_node = Node.new(finish)
  end

  def out_of_bounds?(coordinate)
    return false if coordinate.all? { |num| (0..7).include?(num) }

    true
  end

  def find_moves(coordinate)
    x = coordinate[0]
    y = coordinate[1]
    moves_array = []
    [-2, -1, 1, 2].permutation(2) { |perm| moves_array << [x + perm[0], y + perm[1]] unless (perm[0] + perm[1]).zero? }
    moves_array
  end

  def create_tree_exhaustive(node = root, sequence = [])
    return if node.data == given_node.data

    possible_moves = find_moves(node.data)
    valid_moves = possible_moves.reject { |move| out_of_bounds?(move) || sequence.include?(move) }
    valid_moves.each { |move| node.children << Node.new(move) }
    node.children.each do |child_node|
      sequence << node.data
      # puts "sequence: #{sequence} child_node: #{child_node.data}"
      create_tree_exhaustive(child_node, sequence)
      sequence.pop
    end
  end

  def create_tree_queue
    queue = [root]
    move_history = []
    loop do
      discovered_node = queue.pop
      move_history << discovered_node.data
      valid_moves = find_moves(discovered_node.data).reject { |move| out_of_bounds?(move) || move_history.include?(move) }
      valid_moves.each { |move| discovered_node.children << Node.new(move) }
      return if valid_moves.include?(given_node.data)

      discovered_node.children.each { |child_node| queue.unshift(child_node) }
    end
  end

  def find_path(node = root, path = [])
    return path.unshift(node.data) if node.data == given_node.data

    node.children.each do |child_node|
      return path.unshift(node.data)  if find_path(child_node, path)
    end
    false
  end

end

def knight_moves(start, finish)
  tree = Tree.new(start, finish)
end
