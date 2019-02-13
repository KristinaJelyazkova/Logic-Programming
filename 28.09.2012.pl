split([],[],[]).
split([H|T],[H|R],L):-split(T,R,L).
split([H|T],R,[H|L]):-split(T,R,L).

append([],R,R).
append([H|T],R,[H|L]):-append(T,R,L),not((member(H,L))).
append([H|T],R,L):-append(T,R,L),member(H,L).

union([],[]).
union([H|T],S):-union(T,R),append(H,R,S).

equal(L1,L2):-length(L1,Y1),length(L2,Y2),Y1==Y2,not((member(X,L1),not((member(X,L2))))).

p(L):-not((not((split(L,L1,L2),union(L1,X1),union(L2,X2),equal(X1,X2))))).

%----------------------------------------------------------------

between(A,A,B):-A=<B.
between(X,A,B):-A<B,A1 is A+1,between(X,A1,B).

nat(2).
nat(X):-nat(Y),X is Y+1.

minus(0,0).
minus(X,X):-X\=0.
minus(X,-X):-X\=0.

triples(A,B,C):-nat(Sum),between(C,2,Sum),R is Sum-C,between(A1,0,R),B1 is R-A1,minus(A1,A),minus(B1,B).

triangle4(X1,Y1,C1,C2,X2,Y1,X1,Y3):-X2 is X1+C2,Y3 is Y1+C1.
triangle4(X1,Y1,C1,C2,X2,Y1,X1,Y3):-X2 is X1-C2,Y3 is Y1+C1.
triangle4(X1,Y1,C1,C2,X2,Y1,X1,Y3):-X2 is X1-C2,Y3 is Y1-C1.
triangle4(X1,Y1,C1,C2,X2,Y1,X1,Y3):-X2 is X1+C2,Y3 is Y1-C1.

triangle3(X1,Y1,C1,C2,X2,Y2,X3,Y3):-triangle4(X1,Y1,C1,C2,X2,Y2,X3,Y3).
triangle3(X1,Y1,C1,C2,X2,Y2,X3,Y3):-triangle4(X1,Y1,C1,C2,X3,Y3,X2,Y2).

triangle2(X1,Y1,C1,C2,X2,Y2,X3,Y3):-triangle3(X1,Y1,C1,C2,X2,Y2,X3,Y3).
triangle2(X1,Y1,C1,C2,X2,Y2,X3,Y3):-C1\=C2,triangle3(X1,Y1,C2,C1,X2,Y2,X3,Y3).

triangle([X1,Y1,X2,Y2,X3,Y3]):-triples(X1,Y1,S),X is S-1,between(C1,1,X),C2 is S-C1,triangle2(X1,Y1,C1,C2,X2,Y2,X3,Y3).
