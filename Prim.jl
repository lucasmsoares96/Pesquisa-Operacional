module Prim
using GraphPlot
using Graphs
using SimpleWeightedGraphs
include("./Commom.jl")
using .Commom

export prim
function prim(g, r)
    # g → grafo
    # r → vertice inicial

    N = collect(vertices(g))   # conjunto de todos os nós
    A = collect(edges(g))      # conjunto de todos os nós

    E = Tuple{Int64, Int64}[]  # arestas que formam a árvore gerador mínima
    T = [r]                    # nós conectados à solução parcial
    V = filter(x -> x != r, N) # nós ainda isolados

    imprimir(E, T, V)
    while sort(T) ≠ sort(N)
        arestas = unique([edge(g, j, k) for j ∈ T, k ∈ V])
        e = reduce(
            (acc, val) -> val.weight < acc.weight ? val : acc,
            arestas
        )
        j = src(e)
        k = dst(e)
        push!(T, k)
        filter!(x -> x != k, V)
        push!(E, (j, k))
        imprimir(E, T, V)
    end
    return E
end
end