include("./Commom.jl")
using .Commom
using GraphPlot
using Graphs
using SimpleWeightedGraphs

∅ = Set()
function prim(g, r)

    # g → grafo
    # r → vertice inicial

    N = Set(vertices(g))       # conjunto de todos os nós
    A = Set(edges(g))          # conjunto de todos os nós

    E = ∅                      # arestas que formam a árvore gerador mínima
    T = Set([r])               # nós conectados à solução parcial
    V = filter(x -> x != r, N) # nós ainda isolados

    imprimir(E, T, V)
    while T ≠ N && T ≠ ∅
        arestas = Set([edge(g, j, k) for j ∈ T, k ∈ V])
        e = reduce(
            (acc, val) -> val.weight < acc.weight ? val : acc,
            arestas
        )
        j = src(e)
        k = dst(e)
        T = ∪(T, [k])
        delete!(V, k)
        E = ∪(E, [(j, k)])
        imprimir(E, T, V)
    end
    # display(E)
    return E
end


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

g = SimpleWeightedGraph(graph)

display(prim(g,1))