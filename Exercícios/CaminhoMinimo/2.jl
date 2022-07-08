include("../../Bellman-Ford.jl")
using .BellmanFord
using GraphPlot
using Graphs
using SimpleWeightedGraphs

graph = [
    0 -2 0 0 0 0
    0 0 0 0 0 0
    4 -3 0 7 0 0
    -2 0 0 0 0 0
    0 0 -10 -5 0 -4
    -5 0 0 -1 0 0
];

# graph = [
#     0 2 0 0 0 0
#     0 0 0 0 0 0
#     -4 3 0 -7 0 0
#     2 0 0 0 0 0
#     0 0 10 5 0 4
#     5 0 0 1 0 0
# ];

w = SimpleWeightedDiGraph(graph)


print(bellmanford(w, 5, 2))


desenhar(w)