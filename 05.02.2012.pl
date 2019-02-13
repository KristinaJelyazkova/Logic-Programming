m(_,[]).
m(L,[H|N]):-m(L,N),member(H,L).

unique([],[]).
unique([H|T],[H|L]):-unique(T,L),not((member(H,L))).
unique([H|T],L):-unique(T,L),member(H,L).

p(L,M):-unique(L,U),m(U,M),member(X,M),member(Y,M),A1 is X-Y,member(A1,U),A2 is X*Y,member(A2,U),A3 is X+Y,member(A3,U).

%-------------------------------------------------------

%split(matrix,first column,matrix without first column)
split([[]|_],[],[]).
split([],[],[]).
split([[A|N]|Rest],[A|T],[N|L]):-split(Rest,T,L).

t([[]|_],[]).
t([A|M],[H|T]):-split([A|M],H,Rest),t(Rest,T).
