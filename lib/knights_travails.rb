require 'pry-byebug'

class Tree
  def initialize(start, finish)
    @root = start
    @given_node = finish
  end
end

def out_of_bounds?(coordinate)
  board = Array.new(8) { Array.new(8, 'x') }
  return false if board.dig(coordinate[0], coordinate[1])

  true
end

def find_moves(coordinate)
  x = coordinate[0]
  y = coordinate[1]
  moves = [[x + 1, y + 2], [x + 1, y - 2], [x - 1, y + 2], [x - 1, y - 2], [x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1]]
end
