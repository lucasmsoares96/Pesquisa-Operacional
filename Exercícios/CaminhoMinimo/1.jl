include("../../Commom.jl")
include("../../Dijkstra.jl")
using GraphPlot
using Graphs
using SimpleWeightedGraphs
using .Commom
using .Dijkstra

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
desenhar(w)

print(dijkstra(w, 5, 3))
