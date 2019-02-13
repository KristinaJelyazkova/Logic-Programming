isgrowing([]).
isgrowing([_]).
isgrowing([A,B|T]):-A=<B,isgrowing([B|T]).

isgrowing2([]).
isgrowing2([_]).
isgrowing2([A,B|T]):-A<B,isgrowing2([B|T]).

findC([A,B|_],B):-A>B.
findC([A,B|T],C):-A=<B,findC([B|T],C).

areAllC([],_).
areAllC([_],_).
areAllC([A,B|T],C):-A=<B,areAllC([B|T],C).
areAllC([A,B|T],C):-A>B,B==C,areAllC([B|T],C).

buildSubsequence([],[]).
buildSubsequence([_],[]).
buildSubsequence([A,B|T],L):-A=<B,buildSubsequence([B|T],L).
buildSubsequence([A,B|T],[A|L]):-A>B,buildSubsequence([B|T],L).


p(L):-isgrowing(L).
p(L):-not((isgrowing(L))),findC(L,C),areAllC(L,C),buildSubsequence(L,S),isgrowing2(S).


%--------------------------------------------------

path(_,A,[A|T],[A|T]).
path(E,A,[B|T],P):-member([X,B],E),not((member(X,[B|T]))),path(E,A,[X,B|T],P).

%hasPath(Edges,From,To,Path)
hasPath(E,A,B,P):-path(E,A,[B],P).

p(E,V):-member([V,U],E),hasPath(E,U,V,_).
