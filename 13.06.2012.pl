between(A,A,B):-A=<B.
between(X,A,B):-A<B,A1 is A+1,between(X,A1,B).

genSquare(X1,Y1,A,X,Y):-X2 is ceiling(X1),Y2 is ceiling(Y1),X3 is X1+A,Y3 is Y1+A,X4 is floor(X3),Y4 is floor(Y3),between(X,X2,X4),between(Y,Y2,Y4).

isInCircle(X2,Y2,R,X,Y):-X1 is X2-X,Y1 is Y2-Y,X3 is X1*X1,Y3 is Y1*Y1,A is X3+Y3,B is sqrt(A),B=<R.

p(X1,Y1,A,X2,Y2,R,X,Y):-genSquare(X1,Y1,A,X,Y),isInCircle(X2,Y2,R,X,Y).

%----------------------------------------------------------------

isFunction(L):-not((member([X1,Y1],L),member([X2,Y2],L),X1==X2,Y1\=Y2)).

i(L):-isFunction(L),not((member([X1,Y1],L),member([X2,Y2],L),X1\=X2,Y1==Y2)).

isMonGrowing(L):-not((member([X1,Y1],L),member([X2,Y2],L),X1=<X2,Y1>Y2)).


isMonDecreasing(L):-not((member([X1,Y1],L),member([X2,Y2],L),X1=<X2,Y1<Y2)).

m(L):-isFunction(L),not((not((isMonGrowing(L))),not((isMonDecreasing(L))))).

s([],_,[]).
s([[X,Y]|L1],L2,[[X,Z]|L3]):-member([Y,Z],L2),s(L1,L2,L3).
s([[_,Y]|L1],L2,L3):-not((member([Y,_],L2))),s(L1,L2,L3).

