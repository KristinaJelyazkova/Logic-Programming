nat(0).
nat(X):-nat(Y),X is Y+1.

gen(0,_,_,[]).
gen(Sum,First,B,[First|T]):-Rest is Sum-First,Rest>=0,Next is First+B,gen(Rest,Next,B,T).

p(A):-nat(Sum),between(0,Sum,First),S is Sum-First+1,between(1,S,B),gen(Sum,First,B,A).


%----------------------------------------------------------------

merge(A,[],A).
merge([],B,B).
merge([X|T],[H|B],[X|C]):-merge(T,[H|B],C).
merge([H|A],[X|T],[X|C]):-merge([H|A],T,C).

q(A,[],A).
q(A,[X|T],[X|C]):-merge(A,T,C).
