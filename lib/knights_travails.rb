require 'pry-byebug'

def out_of_bounds?(coordinate)
  board = Array.new(8) { Array.new(8, 'x') }
  return false if board.dig(coordinate[0], coordinate[1])

  true
end
