module Dijkstra
using GraphPlot
using Graphs
using SimpleWeightedGraphs
include("./Commom.jl")
using .Commom

export dijkstra, desenhar


function dijkstra(g, s, t)
    # g -> grafo
    # s -> nó de origem
    # t -> nó de destino

    n = collect(vertices(g))  # conjunto de todos os nós
    a = collect(edges(g))     # conjunto de todos os nós

    R = [s]                   # conjunto de nós que já sabemos o caminho mínimo
    Q = filter(x -> x ≠ s, n) # conjunto de nós que NÃO sabemos o caminho mínimo
    C = []                    # arestas que formam o caminho mínimo
    d = [∞ for i ∈ n]         # di representa a menor distância do nó s até i
    p = [-1 for i ∈ n]        # pi representa o nó pai
    d[s] = 0                  # distância do nó inicial
    r = s                     # nó atual do algortimo

    while r ≠ t
        imprimir(R, Q, r, d, p)
        cont = 1
        for i ∈ Q
            if i ∈ outneighbors(g, r)
                dist = d[r] + edge(g, r, i).weight
                if dist < d[i]
                    d[i] = dist
                    p[i] = r
                end
                if d[i] == ∞
                    cont += 1
                end
            end
        end
        if count == size(Q)
            break
        end
        k = reduce(
            (acc, val) -> val[2] < acc[2] ? val : acc,
            [(i, x) for (i, x) ∈ enumerate(d) if x ≠ ∞ && i ∈ Q]
        )[1]
        Q = filter(x -> x ≠ k, Q)
        push!(R, k)
        r = k
    end
    imprimir(R, Q, r, d, p)
    while r ≠ s
        pushfirst!(C, (p[r], r))
        r = p[r]
    end
    return C
end
end