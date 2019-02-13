divisors(N,D):-between(2,N,D),R is N mod D,R==0.

isPrime(X):-sqrt(X,Y),ceiling(Y,Z),not((between(2,Z,D),D<X,R is X mod D,R==0)).

primeDivisors(N,D):-divisors(N,D),isPrime(D).

smallestPrimeDivisor(N,K):-primeDivisors(N,K),not((primeDivisors(N,D),D<K)).

allPrimeDivisors(1,[]).
allPrimeDivisors(N,[K|X]):-smallestPrimeDivisor(N,K),N1 is N/K,allPrimeDivisors(N1,X),not((member(K,X))).
allPrimeDivisors(N,X):-smallestPrimeDivisor(N,K),N1 is N/K,allPrimeDivisors(N1,X),member(K,X).

%----------------------------------------------------------------

p(X):-not((not((member(L,X),append(A,[5|B],L),append(A,B,L1),member(5,L1))))).

common([],_,[]).
common([X|T],L,[X|R]):-member(X,L),common(T,L,R),not((member(X,R))).
common([X|T],L,R):-member(X,L),common(T,L,R),member(X,R).
common([X|T],L,R):-not((member(X,L))),common(T,L,R).

q(X):-not((member(Y,X),member(Z,X),common(Y,Z,L),length(L,N),N=<2)).

nat(1).
nat(X):-nat(Y),X is Y+1.

unique([],[]).
unique([H|T],[H|R]):-unique(T,R),not((member(H,R))).
unique([H|T],R):-unique(T,R),member(H,R).

count([],_,0).
count([H|T],N,C):-length(H,L),L=<N,count(T,N,C1),C is C1+1.
count([H|T],N,C):-length(H,L),L>N,count(T,N,C).

r(X):-unique(X,Y),length(Y,L),between(1,L,K),N2 is K*2,count(Y,N2,C),C>=K.

