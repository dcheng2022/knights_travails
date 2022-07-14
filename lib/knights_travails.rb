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
end

def knight_moves(start, finish)
  tree = Tree.new(start, finish)
end
