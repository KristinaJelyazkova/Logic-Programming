between(A,A,B):-A=<B.
between(X,A,B):-A<B,A1 is A+1,between(X,A1,B).

genSubrow1([X|_],1,1,[X]).
genSubrow1([_|T],A,B,R):-A>1,A1 is A-1,genSubrow1(T,A1,B,R).
genSubrow1([H|T],1,B,[H|R]):-B>1,B1 is B-1,genSubrow1(T,1,B1,R).

genSubrow(_,[]).
genSubrow(L,R):-length(L,M),between(A,1,M),F is M - A + 1,between(B,1,F),genSubrow1(L,A,B,R).

equal([],[]).
equal([H|T],[H|T2]):-equal(T,T2).

isSubrow(L,R):-length(L,W),length(R,Q),F is W-Q+1,between(A,1,F),genSubrow1(L,A,Q,M),equal(M,R).

genCommonSubrow([],[]).
genCommonSubrow([H|T],M):-genSubrow(H,M),not((member(X,T),not((isSubrow(X,M))))).

longestSubrow(L,M):-genCommonSubrow(L,M),length(M,Q),not((genCommonSubrow(L,N),length(N,W),W>Q)).

%-------------------------------------------------------

isSymm(L):-not((member([A,B],L),not((member([B,A],L))))).

isTrans(L):-not((member([A,B],L),member([B,C],L),not((member([A,C],L))))).

allStartingWith(_,_,[],[]).
allStartingWith(Y,X,[[Y,Z]|T],[[X,Z]|R]):-allStartingWith(Y,X,T,R).
allStartingWith(Y,X,[[A,_]|T],R):-A\=Y,allStartingWith(Y,X,T,R).

compose([],_,[]).
compose([[X,Y]|L1],L2,L3):-allStartingWith(Y,X,L2,R),compose(L1,L2,M),append(R,M,L3).
