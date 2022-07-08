include("../../Dijkstra.jl")
using .Dijkstra
using GraphPlot
using Graphs
using SimpleWeightedGraphs

graph = [
    0 2 0 0 0 0
    0 0 0 0 0 0
    0 3 0 0 0 0
    2 0 2 0 0 0
    0 0 10 5 0 4
    5 0 0 1 0 0
];

w = SimpleWeightedDiGraph(graph)

print(dijkstra(w, 5, 3))

desenhar(w)