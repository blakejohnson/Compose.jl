
require("compose.jl")

function sierpinski(n)
    if n == 0; return(Polygon((1, 1), (0, 1), (1/2, 0))); end

    t = sierpinski(n - 1)
    compose!(Canvas(),
            (Canvas(1/4,   0, 1/2, 1/2), t),
            (Canvas(  0, 1/2, 1/2, 1/2), t),
            (Canvas(1/2, 1/2, 1/2, 1/2), t))
end

img = SVG("sierpinski.svg", 7inch, 7(sqrt(3)/2)inch)
draw(img, compose!(sierpinski(2), Fill(nothing), LineWidth(0.1mm)))
destroy(img)
