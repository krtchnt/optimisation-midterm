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

#title-slide[]

= Problem

== Graph Colouring (NP-hard)
Given an undirected graph $G = (V, E)$, assign a colour to each vertex so that
adjacent vertices have different colours. The goal is to minimise the number of
colours used (the chromatic number -- $chi(G)$).

- Decision version: can $G$ be coloured with $k$ colours?
- Optimisation version: minimise the number of colours


#align(center)[
  #diagram(
    spacing: 1.6em,
    node((0, 1.4), [], name: <A>, fill: rgb("#f4a261"), radius: 0.4em),
    node((1.3, 0.7), [], name: <C>, fill: rgb("#a8dadc"), radius: 0.4em),
    node((1.3, -0.7), [], name: <E>, fill: rgb("#b7e4c7"), radius: 0.4em),
    node((0, -1.4), [], name: <B>, fill: rgb("#f4a261"), radius: 0.4em),
    node((-1.3, -0.7), [], name: <D>, fill: rgb("#a8dadc"), radius: 0.4em),
    node((-1.3, 0.7), [], name: <F>, fill: rgb("#b7e4c7"), radius: 0.4em),
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
]

== Why it matters
- Frequency assignment in wireless networks
- Exam/meeting timetabling
- Register allocation in compilers
- Map colouring and visualisation

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

// TODO: add this graph: V={1,2,3,4,5,6}, E={(1,2),(1,5),(2,3),(2,5),(3,2),(3,4),(4,5),(4,6)}
// and highlight the triangle {1,2,5} that form a maximum clique

// TODO: add the generalised petersen graph GP(12,4)
// and highlight the 9 vertices that form a maximum independent set

= Formulation

== Variables and constraints
Let $x_v in {1, dots, K}$ be the colour of vertex $v$.

Constraints:

$forall (u, v) in E: x_u != x_v$

Optimisation target: minimise the number of used colours.

== Optimisation-friendly objective
We use an unconstrained fitness that penalises conflicts:

$"fitness"(x) = M dot limits(sum)_((u, v) in E) 1 [x_u = x_v] + |{x_v: v in V}|$

- $M$ is a large penalty (e.g., $|E| + 1$)
- Works with heuristic search (GA, SA, PSO)

= Approach

== Representation
- Individual: integer vector of length $|V|$
- Gene: colour index in ${1, dots, K}$

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

// TODO: add an example of a complex graph which is difficult to colour optimally
// with a caption $Chi(G) = ?$ as a rhetorical question

= Example

== Example graph
Petersen graph (10 vertices, chromatic number 3):
#v(0.4em)

#align(center)[
  #diagram(
    spacing: 2.1em,
    node((0, -2.2), [A], name: <A>),
    node((2.1, -0.7), [B], name: <B>),
    node((1.3, 1.8), [C], name: <C>),
    node((-1.3, 1.8), [D], name: <D>),
    node((-2.1, -0.7), [E], name: <E>),
    node((0, -1.2), [F], name: <F>),
    node((1.1, -0.4), [G], name: <G>),
    node((0.7, 0.9), [H], name: <H>),
    node((-0.7, 0.9), [I], name: <I>),
    node((-1.1, -0.4), [J], name: <J>),
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
]

== Example colouring
One optimal 3-colouring (minimum possible):

#align(center)[
  #diagram(
    spacing: 2.1em,
    node((0, -2.2), [A], name: <A>, fill: rgb("#f4a261")),
    node((2.1, -0.7), [B], name: <B>, fill: rgb("#a8dadc")),
    node((1.3, 1.8), [C], name: <C>, fill: rgb("#b7e4c7")),
    node((-1.3, 1.8), [D], name: <D>, fill: rgb("#f4a261")),
    node((-2.1, -0.7), [E], name: <E>, fill: rgb("#a8dadc")),
    node((0, -1.2), [F], name: <F>, fill: rgb("#a8dadc")),
    node((1.1, -0.4), [G], name: <G>, fill: rgb("#f4a261")),
    node((0.7, 0.9), [H], name: <H>, fill: rgb("#f4a261")),
    node((-0.7, 0.9), [I], name: <I>, fill: rgb("#b7e4c7")),
    node((-1.1, -0.4), [J], name: <J>, fill: rgb("#b7e4c7")),
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
]

= Implementation

== Python formulation highlights
- Graph as edge list
- Fitness = conflicts penalty + colour count
- GA with tournament selection and mutation

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
- Conflict count and colours used
- Ready for inspection or further refinement

#user("python 6814001748_midterm.py")
#no-codly[```c
Best colouring: [2, 3, 1, 2, 3, 1, 2, 3, 3, 1]
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

// TODO: add project repo link + qr code

#focus-slide([Thank you! \ #text(0.67em, [Any questions?])])
