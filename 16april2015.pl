sublist([H|L],[H|S],M,N):-M==1,N>1,N1 is N - 1,sublist(L,S,M,N1).
sublist([_|L],S,M,N):-M>1,N>1,M1 is M - 1,sublist(L,S,M1,N).
sublist([H|_],[H],M,1):-M==1.

between(A,A,B):-A=<B.
between(X,A,B):-A<B,A1 is A + 1, between(X,A1,B).

bigger([H|Z],[H1|X]):-H>H1,bigger(Z,X).
bigger([],[]).

lastelemequal([X],[X]).
lastelemequal([X],[_|T]):-lastelemequal([X],T).
lastelemequal([_|T],[X]):-lastelemequal(T,[X]).
lastelemequal([_|T],[_|T1]):-lastelemequal(T,T1).
%lastelemequal(L,[_|T1]):-lastelemequal(L,T1).
%lastelemequal([_|T],L):-lastelemequal(T,L).

p(X,Y,Z):-length(Y,L),L1 is L - 1,between(M,1,L1),length(X,L2),sublist(Y,Z,M,L2),bigger(Z,X),lastelemequal(Z,Y).

m(_,[]).
m(L,[H|T]):-m(L,T),member(H,L).

countfirst([_],1,[]).
countfirst([H1,H2|T],1,[H2|T]):-H1\=H2.
countfirst([H1,H2|T],M1,N):-H1==H2,countfirst([H2|T],M,N),M1 is M + 1.

count([],[0]).
count(L,[H|T]):-L\=[],countfirst(L,H,N),count(N,T).

max(A,A,B):-A>=B.
max(B,A,B):-A<B.

max([X],X).
max([H|T],M):-max(T,N),max(M,N,H).

notmember(_,[]).
notmember(X,[H|T]):-X\=H,notmember(X,T).

p(X,Y):-m(X,Y),sort(Y,S),count(S,R),max(R,M),notmember(M,X).
