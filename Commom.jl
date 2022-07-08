module Commom
using GraphPlot
import Graphs: edges
using Graphs
using SimpleWeightedGraphs

export imprimir, desenhar,edge, edges, ∅, ∞

∅ = []
∞ = Inf

function imprimir(R, Q, r, d, p, h)
    print("R:")
    println(R)
    print("Q:")
    println(Q)
    print("r:")
    println(r)
    print("d:")
    println(d)
    print("p:")
    println(p)
    print("h:")
    println(h)
    println()
end
function imprimir(R, Q, r, d, p)
    print("R:")
    println(R)
    print("Q:")
    println(Q)
    print("r:")
    println(r)
    print("d:")
    println(d)
    print("p:")
    println(p)
    println()
end
function imprimir(E, T, V)
    print("T:")
    println(T)
    print("V:")
    println(V)
    print("E':")
    println(E)
    println()
end
function imprimir(d, p)
    print("d:")
    display(d)
    print("p:")
    display(p)
    println()
end

function desenhar(g::AbstractSimpleWeightedGraph{Int64,Int64})
    arestas = edges(g)
    pesos = [p.weight for p ∈ arestas]
    display(gplot(g, edgelabel=pesos, nodelabel=1:nv(g), edgelabeldistx=0.5, edgelabeldisty=0.5))
end

edges(g::AbstractSimpleWeightedGraph{Int64,Int64}, v::Int64) = [e for e ∈ edges(g) if src(e) == v]

function edge(g::SimpleWeightedGraph{Int64,Int64}, s, d)
    for e ∈ edges(g)
        if (dst(e) == d && src(e) == s)
            return e
        elseif (dst(e) == s && src(e) == d)
            return SimpleWeightedEdge(s, d, e.weight)
        end
    end
    return SimpleWeightedEdge(s, d, ∞)
end
function edge(g::SimpleWeightedDiGraph{Int64,Int64}, s, d)
    for e ∈ edges(g)
        if dst(e) == d && src(e) == s
            return e
        end
    end
    return SimpleWeightedEdge(s, d, ∞)
end
end