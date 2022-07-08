include("../../Prim.jl")
using .Prim
using GraphPlot
using Graphs
using SimpleWeightedGraphs

graph = [
    00 01 05 07 09 00
    01 00 06 04 03 00
    05 06 00 05 00 10
    07 04 05 00 08 03
    09 03 00 08 00 00
    00 00 10 03 00 00
]

w = SimpleWeightedGraph(graph)

print(prim(w, 3))

desenhar(w)