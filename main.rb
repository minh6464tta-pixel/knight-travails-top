require_relative 'lib/graph'

graph = ChessGraph.new
p graph.shortest_path([0, 0], [7, 7])
