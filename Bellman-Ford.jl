module BellmanFord
using GraphPlot
using Graphs
using SimpleWeightedGraphs
include("./Commom.jl")
using .Commom

export bellmanford, desenhar

function bellmanford(g, s, t)
    # g -> grafo
    # s -> nó de origem
    # t -> nó de destino

    N = collect(vertices(g))   # conjunto de todos os nós
    A = collect(edges(g))      # conjunto de todos os nós

    R = []                     # conjunto de nós que já sabemos o caminho mínimo
    Q = N                      # conjunto de nós que NÃO sabemos o caminho mínimo
    C = []                     # arestas que formam o caminho mínimo
    d = [∞ for i ∈ N]          # d[i] menor distância do nó s até i
    p = [-1 for i ∈ N]         # p[i] o nó pai
    h = [0 for i ∈ N]          # h[i] vezes que o vertice foi rotulado
    d[s] = 0                   # distância do nó inicial
    r = s                      # nó atual do algortimo

    imprimir(R, Q, r, d, p, h)
    while Q ≠ ∅ && all([h[i] < length(N) for i ∈ vertices(g)])
        h[r] = h[r] + 1
        Q = filter(x -> x ≠ r, Q)
        push!(R, r)
        for i ∈ N
            dist = d[r] + edge(g, r, i).weight
            if dist < d[i]
                d[i] = dist
                p[i] = r
                if i ∈ R
                    R = filter(x -> x ≠ i, R)
                    push!(Q, i)
                end
            end
        end
        if all([d[i] == ∞ for i ∈ Q])
            break
        end
        k = reduce(
            (acc, val) -> val[2] < acc[2] ? val : acc,
            [(i, x) for (i, x) ∈ enumerate(d) if i ∈ Q]
        )[1]
        r = k
        imprimir(R, Q, r, d, p, h)
    end
    r = t
    while r ≠ s
        pushfirst!(C, (p[r], r))
        r = p[r]
    end
    return C
end
end