max1(A,B,A):-A>=B.
max1(A,B,B):-B>A.

max([X],X).
max([H,H1|L],M1):-max([H1|L],M),max1(M,H,M1).

listMax([],[]).
listMax([H|T],[M|L]):-H\=[],max(H,M),listMax(T,L).
listMax([H|T],L):-H==[],listMax(T,L).

gen(X,Y):-member(Y,X),listMax(X,L),max(L,M1),max(Y,M2),M2=<M1.

p(X,Y):-gen(X,Y),length(Y,L1),not((gen(X,E),length(E,L2),L2>L1)).

%------------------------------------------------

between(A,A,B):-A=<B.
between(X,A,B):-A<B,A1 is A+1,between(X,A1,B).

divisor(X,D):-between(D,1,X),0 is X mod D.

p(A,[M,N],[K,L]):-A1 is A-1,between(M,1,A1),B is A1-M,between(K,1,B),C is M*K,0 is C mod 2,D is C//2,divisor(D,N),N>M,L is D//N,K>L.

nat(1).
nat(X):-nat(Y),X is Y+1.

q(X,Y):-nat(N),p(N,X,Y).
