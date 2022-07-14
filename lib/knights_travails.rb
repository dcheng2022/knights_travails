require 'pry-byebug'

class Node
  attr_accessor :data, :children

  def initialize(data = nil)
    @data = data
    @children = []
  end
end

class Tree
  attr_reader :board, :given_node, :root
  attr_accessor :children

  def initialize(start, finish)
    @root = Node.new(start)
    @given_node = Node.new(finish)
    @board = Array.new(8) { Array.new(8, 'x') }
  end

  def out_of_bounds?(coordinate)
    return false if board.dig(coordinate[0], coordinate[1]) && coordinate.all? { |num| num >= 0 }

    true
  end

  def find_moves(coordinate)
    x = coordinate[0]
    y = coordinate[1]
    moves = [[x + 1, y + 2], [x + 1, y - 2], [x - 1, y + 2], [x - 1, y - 2], [x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1]]
  end
end

def knight_moves(start, finish)
  tree = Tree.new(start, finish)
end
