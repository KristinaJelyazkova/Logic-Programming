check(X):-X>=1,X=<8.

kingmove(A,B,A1,B1):-A1 is A+1,B1 is B+1,check(A1),check(B1).
kingmove(A,B,A1,B):-A1 is A+1,check(A1).
kingmove(A,B,A,B1):-B1 is B+1,check(B1).
kingmove(A,B,A1,B1):-A1 is A-1,B1 is B+1,check(A1),check(B1).
kingmove(A,B,A1,B1):-A1 is A+1,B1 is B-1,check(A1),check(B1).
kingmove(A,B,A1,B):-A1 is A-1,check(A1).
kingmove(A,B,A,B1):-B1 is B-1,check(B1).
kingmove(A,B,A1,B1):-A1 is A-1,B1 is B-1,check(A1),check(B1).

p(X,A,B):-kingmove(A,B,A1,B1),not((member([A1,B1],X))).

kingmove2(A,B,A1,B1):-A1 is A+1,B1 is B+1,check(A1),check(B1).
kingmove2(A,B,A1,B):-A1 is A+1,check(A1).
kingmove2(A,B,A,B1):-B1 is B+1,check(B1).


path(8,8,_).
path(A,B,M):-kingmove2(A,B,A1,B1),not((member([A1,B1],M))),path(A1,B1,[[A1,B1]|M]).

q(X):-not((member([8,8],X))),append([[1,1]],X,M),path(1,1,M).

t(N,[N]).
t(N,[A1,A2|T]):-A is A1+A2,t(N,[A|T]).
t(N,[A1,A2|T]):-A is A1-A2,t(N,[A|T]).

p(N,[N]).
p(N,[A1,A2|T]):-A is A1-A2,t(N,[A|T]).
