include("../../Ford-Fulkerson.jl")
using .FordFulkerson

w = [
    00 04 07 00 00 00
    00 00 00 00 00 00
    00 20 00 00 00 09
    00 00 12 00 00 00
    00 00 00 16 00 13
    14 00 00 04 00 00
]

display(fordfulkerson(w, 5, 2))

desenhar(w)