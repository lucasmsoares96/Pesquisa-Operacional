include("../../Ford-Fulkerson.jl")
using .FordFulkerson

w = [
    00 10 10 00
    00 00 00 10
    00 01 00 10
    00 00 00 00
]

display(fordfulkerson(w, 1, 4))

desenhar(w)