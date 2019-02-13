%take(L,N,R) - takes N elements from L and puts them in R (generates N
% elements from L in R)
remove(E,[E|T],T).
remove(E,[H|T],[H|T1]):-remove(E,T,T1).

take(L,N,[H|T]):-remove(H,L,L1),N1 is N-1,take(L1,N1,T).
take(_,0,[]).

nod(0,X,X).
nod(X,0,X).
nod(X,X,X).
nod(X,Y,R):-X<Y,X>0,Z is Y mod X,nod(Z,X,R).
nod(X,Y,R):-X>Y,nod(Y,X,R).

nodlist([X,Y],R):-nod(X,Y,R).
nodlist([H|T],R):-nodlist(T,R1),nod(R1,H,R).

lengthmorethann(_,0).
lengthmorethann([_|T],N):-N1 is N-1,lengthmorethann(T,N1).

p(L,N):-lengthmorethann(L,N),take(L,N,R),N1 is N-1,not((take(L,N1,R1),nodlist(R,M),nodlist(R1,M))).
