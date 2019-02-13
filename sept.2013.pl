edge([X,Y],E):-member([X,Y],E).
edge([X,Y],E):-member([Y,X],E).

path2(_,X,[X|T],[X|T]).
path2(E,X,[Y|T],P):-X\=Y,edge([Z,Y],E),not((member(Z,[Y|T]))),path2(E,X,[Z,Y|T],P).

path(E,X,Y,P):-path2(E,X,[Y],P).

con(V,E):-not((member(X,V),member(Y,V),not((path(E,X,Y,_))))).

removeEdgesOf([],_,[]).
removeEdgesOf([[_,X]|T],X,R):-removeEdgesOf(T,X,R).
removeEdgesOf([[X,_]|T],X,R):-removeEdgesOf(T,X,R).
removeEdgesOf([[Z,Y]|T],X,[[Z,Y]|R]):-X\=Y,X\=Z,removeEdgesOf(T,X,R).

isCritical(V,E,X):-append(A,[X|B],V),append(A,B,V1),removeEdgesOf(E,X,E1),not((con(V1,E1))).

crit2(_,_,[],[]).
crit2(V,E,[X|T],[X|R]):-isCritical(V,E,X),crit2(V,E,T,R).
crit2(V,E,[X|T],R):-not((isCritical(V,E,X))),crit2(V,E,T,R).

crit(V,E,X):-crit2(V,E,V,X).


%----------------------------------------------------------------

row(0,1).
row(N,X):-N>0,N1 is N-1,row(N1,Y),X is 2*Y+1.

nat(0).
nat(X):-nat(Y),X is Y+1.

row(X):-nat(N),row(N,X).

p(N):-not((not((between(0,N,A),between(0,N,B),row(A,X),row(B,Y),N is X+Y)))).
