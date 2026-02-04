#import "@preview/touying:0.6.1": *
#import themes.university: *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Graph Colouring via Evolutionary Optimisation],
    subtitle: [Optimisation Midterm Examination],
    author: [Kritchanat Thanapiphatsiri],
    date: [February 13, 2026],
    institution: [Department of Computer Engineering \ Kasetsart University],
    logo: box(image("assets/KU_Logo_PNG.png"), width: 1.25cm, baseline: 60%),
  ),
)

#let user(command) = emph(raw("$ ")) + raw(command, lang: "sh")

#show raw: set text(font: "JetBrainsMono NF", size: 16pt)

#let polygon(n, k) = (
  calc.sin(k * 2 * calc.pi / n),
  -calc.cos(k * 2 * calc.pi / n),
)

#let hexagon(k) = polygon(6, k)

#let k_2-2-2_radius = 0.25em
#let k_2-2-2_u = red
#let k_2-2-2_v = green
#let k_2-2-2_w = blue
#let k_2-2-2 = diagram(
  spacing: 2.5em,
  node(hexagon(3), [], name: <A>, fill: k_2-2-2_u, radius: k_2-2-2_radius),
  node(hexagon(0), [], name: <B>, fill: k_2-2-2_u, radius: k_2-2-2_radius),
  node(hexagon(2), [], name: <C>, fill: k_2-2-2_v, radius: k_2-2-2_radius),
  node(hexagon(5), [], name: <D>, fill: k_2-2-2_v, radius: k_2-2-2_radius),
  node(hexagon(1), [], name: <E>, fill: k_2-2-2_w, radius: k_2-2-2_radius),
  node(hexagon(4), [], name: <F>, fill: k_2-2-2_w, radius: k_2-2-2_radius),
  edge(<A>, <C>),
  edge(<A>, <D>),
  edge(<A>, <E>),
  edge(<A>, <F>),
  edge(<B>, <C>),
  edge(<B>, <D>),
  edge(<B>, <E>),
  edge(<B>, <F>),
  edge(<C>, <E>),
  edge(<C>, <F>),
  edge(<D>, <E>),
  edge(<D>, <F>),
)

#let heptagon(k) = polygon(7, k)

#let maximum-clique_radius = 0.25em
#let maximum-clique_paint = red
#let maximum-clique = diagram(
  spacing: 3.3em,
  node(heptagon(1), [], name: <C0>, fill: black, radius: maximum-clique_radius),
  node(heptagon(6), [], name: <C1>, fill: black, radius: maximum-clique_radius),
  node(heptagon(0), [], name: <C2>, fill: black, radius: maximum-clique_radius),
  node(
    heptagon(2),
    [],
    name: <C3>,
    fill: maximum-clique_paint,
    radius: maximum-clique_radius,
  ),
  node(
    heptagon(5),
    [],
    name: <C4>,
    fill: maximum-clique_paint,
    radius: maximum-clique_radius,
  ),
  node(
    heptagon(3),
    [],
    name: <C5>,
    fill: maximum-clique_paint,
    radius: maximum-clique_radius,
  ),
  node(
    heptagon(4),
    [],
    name: <C6>,
    fill: maximum-clique_paint,
    radius: maximum-clique_radius,
  ),
  edge(<C0>, <C1>),
  edge(<C0>, <C2>),
  edge(<C0>, <C3>),
  edge(<C0>, <C5>),
  edge(<C1>, <C2>),
  edge(<C1>, <C4>),
  edge(<C1>, <C6>),
  edge(<C2>, <C3>),
  edge(<C2>, <C4>),
  edge(<C3>, <C4>, stroke: maximum-clique_paint),
  edge(<C3>, <C5>, stroke: maximum-clique_paint),
  edge(<C3>, <C6>, stroke: maximum-clique_paint),
  edge(<C4>, <C5>, stroke: maximum-clique_paint),
  edge(<C4>, <C6>, stroke: maximum-clique_paint),
  edge(<C5>, <C6>, stroke: maximum-clique_paint),
)

#let dodecagon(k) = polygon(12, k)
#let dodecagon_small(k) = dodecagon(k).map(z => z / 1.8)

#let maximum-independent-set_radius = 0.2em
#let maximum-independent-set_paint = blue
#let maximum-independent-set = diagram(
  spacing: 3.2em,
  node(
    dodecagon(6),
    [],
    name: <U0>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(5),
    [],
    name: <U1>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(4),
    [],
    name: <U2>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(3),
    [],
    name: <U3>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(2),
    [],
    name: <U4>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(1),
    [],
    name: <U5>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(0),
    [],
    name: <U6>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(11),
    [],
    name: <U7>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(10),
    [],
    name: <U8>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(9),
    [],
    name: <U9>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(8),
    [],
    name: <U10>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon(7),
    [],
    name: <U11>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),

  node(
    dodecagon_small(6),
    [],
    name: <V0>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(5),
    [],
    name: <V1>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(4),
    [],
    name: <V2>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(3),
    [],
    name: <V3>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(2),
    [],
    name: <V4>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(1),
    [],
    name: <V5>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(0),
    [],
    name: <V6>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(11),
    [],
    name: <V7>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(10),
    [],
    name: <V8>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(9),
    [],
    name: <V9>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(8),
    [],
    name: <V10>,
    fill: maximum-independent-set_paint,
    radius: maximum-independent-set_radius,
  ),
  node(
    dodecagon_small(7),
    [],
    name: <V11>,
    fill: black,
    radius: maximum-independent-set_radius,
  ),

  edge(<U0>, <U1>),
  edge(<U1>, <U2>),
  edge(<U2>, <U3>),
  edge(<U3>, <U4>),
  edge(<U4>, <U5>),
  edge(<U5>, <U6>),
  edge(<U6>, <U7>),
  edge(<U7>, <U8>),
  edge(<U8>, <U9>),
  edge(<U9>, <U10>),
  edge(<U10>, <U11>),
  edge(<U11>, <U0>),

  edge(<V0>, <V4>),
  edge(<V1>, <V5>),
  edge(<V2>, <V6>),
  edge(<V3>, <V7>),
  edge(<V4>, <V8>),
  edge(<V5>, <V9>),
  edge(<V6>, <V10>),
  edge(<V7>, <V11>),
  edge(<V8>, <V0>),
  edge(<V9>, <V1>),
  edge(<V10>, <V2>),
  edge(<V11>, <V3>),

  edge(<U0>, <V0>),
  edge(<U1>, <V1>),
  edge(<U2>, <V2>),
  edge(<U3>, <V3>),
  edge(<U4>, <V4>),
  edge(<U5>, <V5>),
  edge(<U6>, <V6>),
  edge(<U7>, <V7>),
  edge(<U8>, <V8>),
  edge(<U9>, <V9>),
  edge(<U10>, <V10>),
  edge(<U11>, <V11>),
)

#let square(k) = polygon(4, k)

#let small-graph_radius = 0.25em
#let small-graph = diagram(
  spacing: 3.5em,
  node(square(0), [], name: <A>, fill: black, radius: small-graph_radius),
  node(square(1), [], name: <B>, fill: black, radius: small-graph_radius),
  node(square(2), [], name: <C>, fill: black, radius: small-graph_radius),
  node(square(3), [], name: <D>, fill: black, radius: small-graph_radius),
  edge(<A>, <B>),
  edge(<A>, <C>),
  edge(<A>, <D>),
  edge(<B>, <C>),
)

#let hexadecagon(k) = polygon(16, k)

#let large-graph_radius = 0.25em
#let large-graph = diagram(
  spacing: 3.5em,
  node(hexadecagon(0), [], name: <A>, fill: black, radius: large-graph_radius),
  node(hexadecagon(1), [], name: <B>, fill: black, radius: large-graph_radius),
  node(hexadecagon(2), [], name: <C>, fill: black, radius: large-graph_radius),
  node(hexadecagon(3), [], name: <D>, fill: black, radius: large-graph_radius),
  node(hexadecagon(4), [], name: <E>, fill: black, radius: large-graph_radius),
  node(hexadecagon(5), [], name: <F>, fill: black, radius: large-graph_radius),
  node(hexadecagon(6), [], name: <G>, fill: black, radius: large-graph_radius),
  node(hexadecagon(7), [], name: <H>, fill: black, radius: large-graph_radius),
  node(hexadecagon(8), [], name: <I>, fill: black, radius: large-graph_radius),
  node(hexadecagon(9), [], name: <J>, fill: black, radius: large-graph_radius),
  node(hexadecagon(10), [], name: <K>, fill: black, radius: large-graph_radius),
  node(hexadecagon(11), [], name: <L>, fill: black, radius: large-graph_radius),
  node(hexadecagon(12), [], name: <M>, fill: black, radius: large-graph_radius),
  node(hexadecagon(13), [], name: <N>, fill: black, radius: large-graph_radius),
  node(hexadecagon(14), [], name: <O>, fill: black, radius: large-graph_radius),
  node(hexadecagon(15), [], name: <P>, fill: black, radius: large-graph_radius),
  edge(<G>, <O>),
  edge(<I>, <M>),
  edge(<B>, <M>),
  edge(<I>, <O>),
  edge(<D>, <N>),
  edge(<O>, <P>),
  edge(<F>, <O>),
  edge(<A>, <L>),
  edge(<A>, <P>),
  edge(<I>, <J>),
  edge(<G>, <H>),
  edge(<H>, <K>),
  edge(<A>, <J>),
  edge(<I>, <L>),
  edge(<B>, <J>),
  edge(<L>, <M>),
  edge(<C>, <O>),
  edge(<E>, <M>),
  edge(<B>, <D>),
  edge(<C>, <H>),
  edge(<G>, <M>),
  edge(<F>, <G>),
  edge(<A>, <K>),
  edge(<G>, <I>),
  edge(<B>, <F>),
  edge(<D>, <M>),
  edge(<E>, <P>),
  edge(<D>, <J>),
  edge(<J>, <N>),
  edge(<F>, <J>),
  edge(<F>, <P>),
  edge(<E>, <H>),
  edge(<K>, <M>),
  edge(<E>, <N>),
  edge(<E>, <K>),
  edge(<D>, <E>),
  edge(<B>, <N>),
  edge(<M>, <N>),
  edge(<H>, <O>),
  edge(<E>, <I>),
  edge(<H>, <J>),
  edge(<D>, <H>),
  edge(<C>, <P>),
  edge(<M>, <O>),
  edge(<I>, <N>),
  edge(<D>, <I>),
  edge(<B>, <O>),
  edge(<J>, <P>),
  edge(<B>, <H>),
  edge(<E>, <O>),
  edge(<A>, <M>),
  edge(<F>, <L>),
  edge(<A>, <O>),
  edge(<K>, <O>),
  edge(<L>, <O>),
  edge(<C>, <L>),
  edge(<F>, <K>),
  edge(<I>, <P>),
  edge(<J>, <O>),
  edge(<C>, <M>),
  edge(<E>, <L>),
  edge(<A>, <E>),
  edge(<C>, <G>),
  edge(<D>, <L>),
  edge(<J>, <K>),
  edge(<N>, <O>),
  edge(<B>, <E>),
  edge(<H>, <M>),
)

#let pentagon(k) = polygon(5, k)
#let pentagon_small(k) = pentagon(k).map(z => z / 2.1)

#let petersen_spacing = 5.55em
#let petersen_radius = 0.73em
#let petersen_u = red
#let petersen_v = green
#let petersen_w = blue
#let petersen = diagram(
  spacing: petersen_spacing,
  node(pentagon(0), [A], name: <A>, radius: petersen_radius),
  node(pentagon(1), [B], name: <B>, radius: petersen_radius),
  node(pentagon(2), [C], name: <C>, radius: petersen_radius),
  node(pentagon(3), [D], name: <D>, radius: petersen_radius),
  node(pentagon(4), [E], name: <E>, radius: petersen_radius),
  node(pentagon_small(0), [F], name: <F>, radius: petersen_radius),
  node(pentagon_small(1), [G], name: <G>, radius: petersen_radius),
  node(pentagon_small(2), [H], name: <H>, radius: petersen_radius),
  node(pentagon_small(3), [I], name: <I>, radius: petersen_radius),
  node(pentagon_small(4), [J], name: <J>, radius: petersen_radius),
  edge(<A>, <B>),
  edge(<B>, <C>),
  edge(<C>, <D>),
  edge(<D>, <E>),
  edge(<E>, <A>),
  edge(<A>, <F>),
  edge(<B>, <G>),
  edge(<C>, <H>),
  edge(<D>, <I>),
  edge(<E>, <J>),
  edge(<F>, <H>),
  edge(<H>, <J>),
  edge(<J>, <G>),
  edge(<G>, <I>),
  edge(<I>, <F>),
)
#let petersen_label(label) = text(fill: white)[#label]
#let petersen_coloured = diagram(
  spacing: petersen_spacing,
  node(
    pentagon(0),
    petersen_label([A]),
    name: <A>,
    fill: petersen_u,
    radius: petersen_radius,
  ),
  node(
    pentagon(1),
    petersen_label([B]),
    name: <B>,
    fill: petersen_w,
    radius: petersen_radius,
  ),
  node(
    pentagon(2),
    petersen_label([C]),
    name: <C>,
    fill: petersen_v,
    radius: petersen_radius,
  ),
  node(
    pentagon(3),
    petersen_label([D]),
    name: <D>,
    fill: petersen_u,
    radius: petersen_radius,
  ),
  node(
    pentagon(4),
    petersen_label([E]),
    name: <E>,
    fill: petersen_w,
    radius: petersen_radius,
  ),
  node(
    pentagon_small(0),
    petersen_label([F]),
    name: <F>,
    fill: petersen_w,
    radius: petersen_radius,
  ),
  node(
    pentagon_small(1),
    petersen_label([G]),
    name: <G>,
    fill: petersen_u,
    radius: petersen_radius,
  ),
  node(
    pentagon_small(2),
    petersen_label([H]),
    name: <H>,
    fill: petersen_u,
    radius: petersen_radius,
  ),
  node(
    pentagon_small(3),
    petersen_label([I]),
    name: <I>,
    fill: petersen_v,
    radius: petersen_radius,
  ),
  node(
    pentagon_small(4),
    petersen_label([J]),
    name: <J>,
    fill: petersen_v,
    radius: petersen_radius,
  ),
  edge(<A>, <B>),
  edge(<B>, <C>),
  edge(<C>, <D>),
  edge(<D>, <E>),
  edge(<E>, <A>),
  edge(<A>, <F>),
  edge(<B>, <G>),
  edge(<C>, <H>),
  edge(<D>, <I>),
  edge(<E>, <J>),
  edge(<F>, <H>),
  edge(<H>, <J>),
  edge(<J>, <G>),
  edge(<G>, <I>),
  edge(<I>, <F>),
)


#title-slide[]

= Problem

== Graph Colouring (NP-hard)
Given an undirected graph $G = (V, E)$, assign a colour to each vertex so that
adjacent vertices have different colours. The goal is to minimise the number of
colours used (the chromatic number -- $chi(G)$).

#pause

- Decision version: can $G$ be coloured with $k$ colours?
- Optimisation version: search for the smallest feasible $k$

#pause

#align(center)[#k_2-2-2]
#align(center)[#text(size: 18pt)[$chi(G) = 3$]]

== Why it matters
- Frequency assignment in wireless networks
- Exam/meeting timetabling
- Register allocation in compilers
- Map colouring and visualisation

#pause

#v(0.4em)
#align(center)[
  #image("assets/Four_Colour_Planar_Graph.svg", width: 15cm)
]
#align(center)[
  #text(size: 15pt)[
    Image: #link("https://commons.wikimedia.org/wiki/File:Four_Colour_Planar_Graph.svg")[Wikimedia Commons]
  ]
]

== Related problems
- $k$-colouring (feasibility)
- Maximum clique / maximum independent set (bounds)
- Graph colouring as a special case of constraint satisfaction

#let vertical-align = 8.29em

#pause

#v(0.4em)
#align(center)[
  #grid(
    columns: 2,
    gutter: 5em,
    align: center,
    [
      #stack(
        dir: ttb,
        spacing: 0.9em,
        [#box(height: vertical-align)[#align(center)[#maximum-clique]]],
        [#box(height: 1.6em)[#align(center)[#text(
          size: 18pt,
          style: "italic",
        )[_Maximum clique_]]]],
      )
    ],
    pause,

    [
      #stack(
        dir: ttb,
        spacing: 0.9em,
        [#box(height: vertical-align)[#align(
          center,
        )[#maximum-independent-set]]],
        [#box(height: 1.6em)[#align(center)[#text(
          size: 18pt,
          style: "italic",
        )[_Maximum independent set_]]]],
      )
    ],
  )
]

= Formulation

== Variables and constraints
Let $x_v in {1, dots, K}$ be the colour of vertex $v$ (for a given $K$).

#pause

Constraints:
$ forall (u, v) in E: x_u != x_v $

#pause

Optimisation target: minimise the number of used colours.

== Optimisation-friendly objective
We use an unconstrained fitness that penalises conflicts:

#pause

$
  "fitness"(x) = M dot limits(sum)_((u, v) in E) 1 [x_u = x_v] + |{x_v: v in V}|
$

#pause

- $M$ is a large penalty (e.g., $|E| + 1$)
- Works with heuristic search (GA, SA, PSO)

= Approach

== Representation
- Individual: integer vector of length $|V|$
- Gene: colour index in ${1, dots, K}$
- Outer loop: try $k = 1, 2, dots, K$ until a conflict-free colouring is found

== Evolutionary algorithm outline
1. Initialise random population
2. Evaluate fitness
3. Select parents (tournament)
4. Crossover + mutation
5. Elitism, repeat until stop

== Why not solve directly
- Chromatic number is NP-hard
- Exact methods scale poorly
- Evolutionary search can reach optimal with enough exploration

#pause

#let vertical-align-2 = 8.3em

#v(0.4em)
#align(center)[
  #grid(
    columns: 2,
    gutter: 5em,
    align: center,
    [
      #stack(
        dir: ttb,
        spacing: 0.9em,
        [#box(height: vertical-align-2)[#align(center)[#small-graph]]],
        [#box(height: 1.6em)[#align(center)[#text(
          size: 18pt,
        )[$chi(G) = thick ?$]]]],
      )
    ],
    pause,

    [
      #stack(
        dir: ttb,
        spacing: 0.9em,
        [#box(height: vertical-align-2)[#align(center)[#large-graph]]],
        [#box(height: 1.6em)[#align(center)[#text(
          size: 18pt,
        )[$chi(G) = thick ?$]]]],
      )
    ],
  )
]

= Example

== Example graph
Petersen graph (10 vertices, chromatic number 3):
#v(0.24em)

#pause

#align(center)[#petersen]

== Example colouring
One optimal 3-colouring (minimum possible):

#align(center)[#petersen_coloured]

= Implementation

== Python formulation highlights
- Graph as edge list
- Fitness = conflicts penalty + colour count
- GA with tournament selection and mutation

#pause

#codly(
  highlights: (
    (line: 49, start: 5, end: none, fill: green),
    (line: 70, start: 16, end: none, fill: blue),
  ),
  offset: 45,
  skips: ((5, 17),),
)
```py
@dataclass
class Graph:
    n: int
    edges: list[tuple[int, int]]
    def fitness(self, colouring: Sequence[int], penalty: int) -> int:
        conflicts = self.conflicts(colouring)
        colours = type(self).used_colours(colouring)
        return penalty * conflicts + colours
```

== Output format
- Best colouring found
- Found $k$, conflict count, and colours used
- Ready for inspection or further refinement

#pause

#user("python 6814001748_midterm.py")

#pause

#no-codly[```c
Best colouring: [1, 3, 2, 1, 2, 2, 1, 1, 3, 3]
Found k: 3
Conflicts: 0
Colours used: 3
Fitness: 3
```]

= Discussion

== Existing approaches
- Exact: branch-and-bound, ILP, SAT/CP
- Heuristic: DSATUR, greedy with reorder
- Metaheuristics: GA, SA, tabu search, ACO

== Strengths and limitations
- Strength: flexible, easy to adapt
- Limitation: no optimality guarantee without enough search

= Conclusion

== Takeaways
- Graph colouring is NP-hard and practically important
- Evolutionary search offers a scalable path to good solutions
- The provided formulation supports future improvements

#pause

All code and slides are available at:

#align(center, image(
  "assets/repository-qr.png",
  width: 25%,
  scaling: "pixelated",
))

#align(center, text(
  size: 18pt,
)[_ https://github.com/krtchnt/optimisation-midterm _])

#focus-slide([Thank you! \ #text(0.67em, [Any questions?])])
