# Graph
class ChessGraph
  KNIGHT_MOVES = [-1, 1].product([-2, 2]) + [-2, 2].product([-1, 1])

  def initialize
  end

  def shortest_path(source, dest)
    return [source] if source == dest

    queue = []
    prev = {}

    queue.push(source)
    prev[source] = nil
    until queue.empty?
      current = queue.shift
      neighbors(current).each do |square|
        next if prev.key?(square)

        prev[square] = current
        queue.push(square)

        return build_path(prev, dest) if square == dest
      end
    end
  end

  private

  def neighbors(current)
    x, y = current
    KNIGHT_MOVES
      .map { |dx, dy| [x + dx, y + dy] }
      .select { |nx, ny| nx.between?(0, 7) && ny.between?(0, 7) }
  end

  def build_path(prev, dest)
    path = []
    square = dest
    until square.nil?
      path << square
      square = prev[square]
    end
    path.reverse
  end
end
