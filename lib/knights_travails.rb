require 'pry-byebug'

def out_of_bounds?(coordinate)
  board = Array.new(8) { Array.new(8, 'x') }
  return false if board.dig(coordinate[0], coordinate[1])

  true
end

def find_moves(coordinate)
  x = coordinate[0]
  y = coordinate[1]
  moves = [[x + 1, y + 2], [x + 1, y - 2], [x - 1, y + 2], [x - 1, y - 2], [y + 2, x + 1], [y + 2, x - 1], [y - 2, x + 1], [y - 2, x - 1]]
end
