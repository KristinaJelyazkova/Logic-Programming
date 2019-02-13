term([],1).
term([A,[A,B]],N):-N>2,N1 is N-2,between(1,N1,N2),term(A,N1),term(B,N2).
term([A,[A,B]],N):-N>2,N1 is N-2,N2 is N1-1,between(1,N2,N3),term(A,N3),term(B,N1).

nat(1).
nat(X):-nat(Y),X is Y+1.

p(X):-nat(N),term(X,N).

%----------------------------------------------------------------

hasCommonEl(L1,L2):-not((not((member(X,L1),member(X,L2))))).

coherent([]).
coherent([_]).
coherent([L1,L2|T]):-not((not((hasCommonEl(L1,L2),coherent([L2|T]))))).
