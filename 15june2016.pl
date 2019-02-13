divisor(D,A):-between(2,A,D),R is A mod D,R==0.

isDivisor(D,B):-D=<B,R is B mod D,R==0.

coprime(A,B):-not((divisor(D,A),isDivisor(D,B))).

base(L):-not((member(X,L),member(Y,L),X\=Y,not((coprime(X,Y))))).

m(_,[]).
m(M,[H|T]):-m(M,T),member(H,M).

unique([],[]).
unique([H|T],[H|R]):-unique(T,R),not((member(H,R))).
unique([H|T],R):-unique(T,R),member(H,R).

gen(M,L):-unique(M,M1),m(M1,L),base(L).

subset([],[]).
subset([H|T],[H|L]):-subset(T,L).
subset([_|T],L):-subset(T,L).

genUnique(M,L):-unique(M,M1),subset(M1,L),base(L).

maxUnique(M,L):-genUnique(M,L),length(L,N),not((genUnique(M,L1),length(L1,N1),N1>N)).

nat(0).
nat(X):-nat(Y),X is Y+1.

m2(_,[],0).
m2(R,[H|T],X):-X>0,X1 is X-1,m2(R,T,X1),member(H,R).

insert(H,L1,L):-append(A,B,L1),append(A,[H|B],L).

perm([],[]).
perm([H|T],L):-perm(T,L1),insert(H,L1,L).

% gen2(R,L,X):-length(R,N),M is
% X-N,m2(R,L1,M),append(L1,R,L2),perm(L2,L).

gen2(R,L,X):-length(R,N),M is X-N,m2(R,L1,M),append(L1,R,L).

maxWithLength(M,L,X):-maxUnique(M,L),length(L,N),N==X.
maxWithLength(M,L,X):-maxUnique(M,R),length(R,N),N<X,gen2(R,L,X).

max(M,L):-nat(X),maxWithLength(M,L,X).

