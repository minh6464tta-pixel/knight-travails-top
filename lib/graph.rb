# Graph
class ChessGraph
  attr_accessor :adj_mat

  def initialize
  end

  def shortest_path(source, dest)
    return source if source == dest

    x_source, y_source = source
    x_dest, y_dest = dest
    knight_moves = [-1, 1].product([-2, 2]) + [-2, 2].product([-1, 1])
    queue = Queue.new
    visited = {}
    prev = {}

    queue.push([x_source, y_source])
    visited[[x_source, y_source]] = true
    loop do
      current = queue.pop
      knight_moves.each do |x, y|
        move_x = current[0] + x
        next unless move_x.between?(0, 7)

        move_y = current[1] + y
        next unless move_y.between?(0, 7)

        if move_x == x_dest && move_y == y_dest
          # exit the method
          # construct a pat
          result = [[move_x, move_y]]
          while prev[current]
            result << current
            current = prev[current]
          end

          result << current
          return result.reverse
        end

        next if visited[[move_x, move_y]] # skip to the next move if this move has been visited

        queue.push([move_x, move_y])
        visited[[move_x, move_y]] = true
        prev[[move_x, move_y]] = current
      end
    end
  end
end
