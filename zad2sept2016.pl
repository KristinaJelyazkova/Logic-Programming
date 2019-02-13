remove(E,[E|T],T).
remove(E,[H|T],[H|T1]):-remove(E,T,T1).

take(L,N,[H|T]):-remove(H,L,L1),N1 is N-1,take(L1,N1,T).
take(_,0,[]).

member(X,[X|_]).
member(X,[_|T]):-member(X,T).

sum([H|T],S):-sum(T,S1),S is H + S1.
sum([],0).

length2([],0).
length2([_|T],N):-length2(T,N1), N is N1 + 1.

p([A],B):-member(A,B).
p(A,B):-length2(A,M),M>1,not((take(A,2,L),sum(L,S),not(member(S,B)))).


between(B,A,B):-A=<B.
between(X,A,B):-A<B,B1 is B-1,between(X,A,B1).

equal([],[]).
equal([H|T],[H|T1]):-equal(T,T1).

cut(X,[X|T],T).
cut(X,[Y|T],T1):-not((equal(X,Y))),cut(X,T,T1).

q2(L,S):-length2(L,N),between(X,0,N),take(L,X,S),not((member(Y,S),cut(Y,S,S1),member(Z,S1),not((p(Y,Z))))).

q(L,S):-q2(L,S),length(S,N),not((q2(L,S1),length(S1,N1),N1>N)).

