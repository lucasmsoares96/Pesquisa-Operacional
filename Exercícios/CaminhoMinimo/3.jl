include("../../Floyd-Warshall.jl")
using .FloydWarshall
using GraphPlot
using Graphs
using SimpleWeightedGraphs

graph = [
    0 -2 0 0
    0 0 0 2
    4 7 0 0
    0 0 -2 0
];

# graph = [
#     0 0 -2 0
#     4 0 3 0
#     0 0 0 2
#     0 -1 0 0
# ];

w = SimpleWeightedDiGraph(graph)

d, p = floydwarshall(w)

println("Resultado:")
display(d)
display(p)
println()

for s ∈ vertices(w), t ∈ vertices(w)
    caminho, peso = menorcaminho(d, p, s, t)
    if peso ≠ 0
        println("Caminho($s,$t)")
        display(caminho)
        print("Peso: ")
        display(sum(peso))
        println()
    end
end

desenhar(w)