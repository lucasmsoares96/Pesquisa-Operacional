module FloydWarshall
include("./Commom.jl")
using .Commom
using GraphPlot
using Graphs
using SimpleWeightedGraphs

export floydwarshall, menorcaminho, desenhar


function menorcaminho(d, p, s, t)
    if (p[s, t] == -1)
        return (0, 0)
    end
    path = [t]
    weight = [d[s, t]]
    while (s != t)
        t = p[s, t]
        pushfirst!(path, t)
        pushfirst!(weight, d[s, t])
    end
    return (path, weight)
end

function floydwarshall(g)
    # g -> grafo

    N = collect(vertices(g))   # conjunto de todos os nós
    A = collect(edges(g))      # conjunto de todos os nós

    d = [∞ for x ∈ N, y ∈ N]
    p = [-1 for x ∈ N, y ∈ N]
    imprimir(d, p)

    for i ∈ N, j ∈ N
        d[i, j] = i == j ? 0 : edge(g, i, j).weight
        p[i, j] = edge(g, i, j).weight != ∞ ? i : -1
    end
    imprimir(d, p)

    for k ∈ vertices(g)
        for i ∈ N
            for j ∈ N
                if d[i, k] + d[k, j] < d[i, j]
                    d[i, j] = d[i, k] + d[k, j]
                    p[i, j] = p[k, j]
                end
            end
        end
        imprimir(d, p)
    end
    return (d, p)
end
end