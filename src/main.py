import random
from dataclasses import dataclass
from itertools import combinations
from typing import Iterable, Self, Sequence


@dataclass
class GAConfig:
    max_colours: int
    population: int = 80
    generations: int = 600
    tournament_k: int = 4
    mutation_rate: float = 0.08
    elite: int = 2
    seed: int = 42


def tournament_select(
    population: list[list[int]], scores: list[int], k: int
) -> list[int]:
    best = None
    best_score = None
    for _ in range(k):
        i = random.randrange(len(population))
        score = scores[i]
        if (best is None or best_score is None) or score < best_score:
            best = population[i]
            best_score = score
    assert best is not None
    return best[:]


def crossover(a: list[int], b: list[int]) -> tuple[list[int], list[int]]:
    if len(a) <= 1:
        return a[:], b[:]
    p = random.randrange(1, len(a))
    return a[:p] + b[p:], b[:p] + a[p:]


def mutate(child: list[int], max_colours: int, rate: float) -> None:
    for i in range(len(child)):
        if random.random() < rate:
            child[i] = random.randrange(1, max_colours + 1)


@dataclass
class Graph:
    n: int
    edges: list[tuple[int, int]]

    @classmethod
    def random(cls, n: int) -> Self:
        m = random.randint(0, (n * (n - 1)) // 2)
        return cls(n, random.sample(tuple(combinations(range(n), 2)), m))

    @staticmethod
    def used_colours(colouring: Iterable[int]) -> int:
        return len(set(colouring))

    def conflicts(self, colouring: Sequence[int]) -> int:
        cnt = 0
        for u, v in self.edges:
            if colouring[u] == colouring[v]:
                cnt += 1
        return cnt

    def fitness(self, colouring: Sequence[int], penalty: int) -> int:
        conflicts = self.conflicts(colouring)
        colours = type(self).used_colours(colouring)
        return penalty * conflicts + colours

    def _ga_for_k(self, cfg: GAConfig, k: int) -> tuple[list[int], int]:
        penalty = len(self.edges) + 1

        population = [
            [random.randrange(1, k + 1) for _ in range(self.n)]
            for _ in range(cfg.population)
        ]

        best = None
        best_score = None

        for _ in range(cfg.generations):
            scores = [self.fitness(ind, penalty) for ind in population]

            # Track best
            for ind, score in zip(population, scores):
                if best is None or score < best_score:
                    best = ind[:]
                    best_score = score

            # Elitism
            ranked = sorted(zip(population, scores), key=lambda x: x[1])
            next_pop = [ind[:] for ind, _ in ranked[: cfg.elite]]

            # Refill population
            while len(next_pop) < cfg.population:
                p1 = tournament_select(population, scores, cfg.tournament_k)
                p2 = tournament_select(population, scores, cfg.tournament_k)
                c1, c2 = crossover(p1, p2)
                mutate(c1, k, cfg.mutation_rate)
                mutate(c2, k, cfg.mutation_rate)
                next_pop.append(c1)
                if len(next_pop) < cfg.population:
                    next_pop.append(c2)

            population = next_pop

        assert not (best is None or best_score is None)
        return best, best_score

    def genetic_colouring(self, cfg: GAConfig) -> tuple[list[int], int, int]:
        random.seed(cfg.seed)

        best = None
        best_score = None
        best_k = None

        for k in range(1, cfg.max_colours + 1):
            colouring, score = self._ga_for_k(cfg, k)
            conflicts = self.conflicts(colouring)
            if conflicts == 0:
                return colouring, score, k

            if (best is None or best_score is None) or (score < best_score):
                best = colouring[:]
                best_score = score
                best_k = k

        assert not (best is None or best_score is None or best_k is None)
        return best, best_score, best_k

    def chromatic_number(self) -> int:
        if self.n == 0:
            return 0

        adj = [0] * self.n
        for u, v in self.edges:
            adj[u] |= 1 << v
            adj[v] |= 1 << u

        size = 1 << self.n
        independent = [False] * size
        independent[0] = True
        for mask in range(1, size):
            lsb = mask & -mask
            v = lsb.bit_length() - 1
            rest = mask ^ lsb
            independent[mask] = independent[rest] and (rest & adj[v] == 0)

        dp = [self.n + 1] * size
        dp[0] = 0
        for mask in range(1, size):
            if independent[mask]:
                dp[mask] = 1
                continue
            lsb = mask & -mask
            sub = mask
            while sub:
                if (sub & lsb) and independent[sub]:
                    candidate = dp[mask ^ sub] + 1
                    if candidate < dp[mask]:
                        dp[mask] = candidate
                sub = (sub - 1) & mask

        return dp[size - 1]


def main() -> None:
    # Example graph from the slides: Petersen graph (A=0..E=4 outer, F=5..J=9 inner)
    graph = Graph(
        n=10,
        edges=[
            (0, 1),
            (1, 2),
            (2, 3),
            (3, 4),
            (4, 0),
            (0, 5),
            (1, 6),
            (2, 7),
            (3, 8),
            (4, 9),
            (5, 7),
            (7, 9),
            (9, 6),
            (6, 8),
            (8, 5),
        ],
    )

    cfg = GAConfig(max_colours=3)
    colouring, score, found_k = graph.genetic_colouring(cfg)

    conflicts = graph.conflicts(colouring)
    colours = Graph.used_colours(colouring)

    print("Best colouring:", colouring)
    print("Found k:", found_k)
    print("Conflicts:", conflicts)
    print("Colours used:", colours)
    print("Fitness:", score)


if __name__ == "__main__":
    main()
