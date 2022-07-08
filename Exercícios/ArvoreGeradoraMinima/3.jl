include("../../Prim.jl")
using .Prim
using GraphPlot
using Graphs
using SimpleWeightedGraphs

graph = [
    0 5 9 20 4 0 0 14 15
    5 0 6 0 0 0 0 0 0
    9 6 0 15 0 0 0 0 0
    20 0 15 0 0 7 0 0 0
    4 0 0 0 0 0 5 13 6
    0 0 0 7 0 0 0 0 0
    0 0 0 0 5 0 0 7 0
    14 0 0 0 13 0 7 0 5
    15 0 0 0 6 0 0 5 0
]

w = SimpleWeightedGraph(graph)

print(prim(w, 1))

desenhar(w)