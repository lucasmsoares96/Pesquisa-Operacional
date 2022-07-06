module PrimExtended
include("./Commom.jl")
using .Commom
using GraphPlot
using Graphs
using SimpleWeightedGraphs

export primextended

function primextended(g, r)
    # g -> grafo
    # r → nó inicial

    N = collect(vertices(g))   # conjunto de todos os nós
    # A = collect(edges(g))    # conjunto de todos os nós

    E = Tuple{Int64,Int64}[]   # arestas que formam a árvore gerador mínima
    T = [r]                    # nós conectados à solução parcial
    V = filter(x -> x != r, N) # nós ainda isolados

    imprimir(E, T, V)
    while V ≠ ∅
        arestas = unique([edge(g, j, k) for j ∈ T, k ∈ V if edge(g, j, k).weight != ∞])
        if arestas == ∅
            arestas = unique(vcat([edges(g, i) for i in V]...))
        end
        e = reduce(
            (acc, val) -> val.weight < acc.weight ? val : acc,
            arestas
        )
        j = src(e)
        k = dst(e)
        if !(j ∈ T)
            push!(T, j)
            filter!(x -> x != j, V)
        end
        push!(T, k)
        filter!(x -> x != k, V)
        push!(E, (j, k))
        imprimir(E, T, V)
    end
    return E
end
end