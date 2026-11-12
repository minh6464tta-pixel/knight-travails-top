require_relative 'lib/graph'

graph = ChessGraph.new
p graph.shortest_path([3, 3], [3, 3])
