% breadth_first_search(+Start, +Goal, -Path)
% Breadth-first search algorithm. Finds a path from Start to Goal.
breadth_first_search(Start, Goal, Path) :-
bfs([[Start]], Goal, RevPath),
reverse(RevPath, Path).
% bfs(+Paths, +Goal, -Path)
% Breadth-first search implementation.
bfs([[Goal|Path]|_], Goal, [Goal|Path]).
bfs([Path|Paths], Goal, Result) :-
Path = [Node|_],
findall([NewNode, Node|Path],
(edge(Node, NewNode), \+ member(NewNode, Path)), NewPaths), append(Paths, NewPaths, NextPaths), bfs(NextPaths, Goal, Result).
% edge(+Node1, -Node2)
% The edge/2 predicate defines the graph we are searching.
% Here, the graph is defined by the edge/2 facts.
edge(a, b).
edge(b, c).
edge(c, d).
edge(c, e).
edge(e, f).
edge(f, g).
