vertices([],[]).
vertices([[U,V]|T],R):-vertices(T,R),member(U,R),member(V,R).
vertices([[U,V]|T],[U|R]):-vertices(T,R),not((member(U,R))),member(V,R).
vertices([[U,V]|T],[V|R]):-vertices(T,R),member(U,R),not((member(V,R))).
vertices([[U,V]|T],[U,V|R]):-vertices(T,R),not((member(U,R))),not((member(V,R))).

dIn([],_,0).
dIn([[_,U]|E],U,X):-dIn(E,U,X1),X is X1+1.
dIn([[_,V]|E],U,X):-V\=U,dIn(E,U,X).

checkIn(E,V):-not((member(U,V),dIn(E,U,X),X\=1)).

dOut([],_,0).
dOut([[U,_]|E],U,X):-dOut(E,U,X1),X is X1+1.
dOut([[_,V]|E],U,X):-V\=U,dOut(E,U,X).

checkOut(E,V):-not((member(U,V),dOut(E,U,X),X\=1)).

p([[X,X]]).
p(E):-not((not((not((member([X,X],E))),vertices(E,V),checkIn(E,V),checkOut(E,V))))).

q(E):-append(A,[[X,X]|B],E),append(A,B,E1),p(E1).
q(E):-not((member([X,X],E))),vertices(E,V),append(A,[Y|B],V),dIn(E,Y,Q),Q==2,dOut(E,Y,W),W==2,append(A,B,V1),checkIn(E,V1),checkOut(E,V1).
