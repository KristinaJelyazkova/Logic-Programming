div(X,N):-X>0,N>0,Y is N mod X,Y==0.

p(L,N):-N>1,member(X,L),div(X,N),N1 is N//X,p(L,N1).
p(_,1).
