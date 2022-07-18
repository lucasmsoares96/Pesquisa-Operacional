module FordFulkerson

include("./Commom.jl")
using .Commom
using GraphPlot
using Graphs
using SimpleWeightedGraphs

export fordfulkerson, desenhar
∅ = Set()

function atualizar_fluxo(G, s, t, y, f⁺, f⁻, p, σ)
    r = t
    P = ∅
    δ = +∞
    while r ≠ s
        if σ[r] == +1
            P = P ∪ Set([(p[r], r)])
            δ = min(δ, f⁺[p[r], r])
        else
            P = P ∪ Set([r, (p[r])])
            δ = min(δ, f⁻[r, (p[r])])
        end
        r = p[r]
    end
    y = y + δ
    for (i, j) ∈ P
        if σ[j] == +1
            f⁺[i, j] = f⁺[i, j] - δ
            f⁻[i, j] = f⁻[i, j] + δ
        else
            f⁺[i, j] = f⁺[i, j] + δ
            f⁻[i, j] = f⁻[i, j] - δ
        end
    end
    return y, f⁺, f⁻
end

function fordfulkerson(w, s, t)
    G = SimpleWeightedDiGraph(w)
    # G -> grafo
    # s -> nó fonte
    # t -> nó sorvedouro

    N = vertices(G)
    A = edges(G)
    y = 0
    f⁺ = [G.weights[j, i] for i ∈ N, j ∈ N]
    f⁻ = [0 for i ∈ N, j ∈ N]

    while true
        R = Set(s)
        L = Set(s)
        p = [-1 for i ∈ N]
        σ = [-1 for i ∈ N]
        while length(L) > 0 && t ∉ R
            i = pop!(L)
            for j ∈ outneighbors(G, i)
                if f⁺[i, j] > 0 && j ∉ R
                    p[j] = i
                    σ[j] = +1
                    R = R ∪ Set(j)
                    L = L ∪ Set(j)
                end
            end
            for j ∈ inneighbors(G, i)
                if f⁻[j, i] > 0 && j ∉ R
                    p[j] = i
                    σ[j] = -1
                    R = R ∪ Set(j)
                    L = L ∪ Set(j)
                end
            end
            imprimir(R, L, i, f⁺, f⁻, p, σ, y)
            if t ∈ R
                y, f⁺, f⁻ = atualizar_fluxo(G, s, t, y, f⁺, f⁻, p, σ)
            end
        end
        if t ∉ R
            break
        end
    end
    return f⁻
end

end
