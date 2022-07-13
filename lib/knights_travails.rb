require 'pry-byebug'

class Tree
  attr_reader :board

  def initialize(start, finish)
    @root = start
    @given_node = finish
    @board = Array.new(8) { Array.new(8, 'x') }
  end

  def out_of_bounds?(coordinate)
    return false if board.dig(coordinate[0], coordinate[1])
  
    true
  end
end

def find_moves(coordinate)
  x = coordinate[0]
  y = coordinate[1]
  moves = [[x + 1, y + 2], [x + 1, y - 2], [x - 1, y + 2], [x - 1, y - 2], [x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1]]
end

def knight_moves(start, finish)
  tree = Tree.new(start, finish)
end
