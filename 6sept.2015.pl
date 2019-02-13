number([],0,_).
number([H|T],N,X):-X1 is X/10,number(T,M,X1),Y is H*X,N is M+Y.

digits(N,[N]):-N<10.
digits(N,[H|T]):-N>=10,H is N mod 10,N1 is N//10,digits(N1,T).

reverse([],[]).
reverse([H|T],L1):-reverse(T,L),append(L,[H],L1).

pow(_,0,1).
pow(X,Y,Z):-Y>0,Y1 is Y-1,pow(X,Y1,Z1),Z is Z1*X.

p(X,Y,Z):-length(X,L1),length(Y,L2),L3 is L1-1,L4 is L2-1,pow(10,L3,A),pow(10,L4,B),number(X,N1,A),number(Y,N2,B),N is N1+N2,digits(N,D),reverse(D,Z).

%----------------------------------------------------------------

braces([],[],_).
braces([0|T],[N,0|R],N):-N1 is N+1,braces(T,R,N1).
braces([1|T],[1,N1|R],N):-N1 is N-1,braces(T,R,N1).

helper(T,A,R1,N):-append(A,[N|R1],T).

makeList([],[],_).
makeList([N|T],[L|R],N):-helper(T,L,R1,N),makeList(R1,R,N).
makeList([X|T],[X|L],N):-X\=N,makeList(T,L,N).

makeListN(L,L,0).
makeListN(L,R,N):-N>0,M is N+1,makeList(L,L1,M),N1 is N-1,makeListN(L1,R,N1).

max2(A,B,B):-A=<B.
max2(A,B,A):-B<A.

max([],0).
max([H|T],M):-max(T,N),max2(N,H,M).

removeBraces([X],X).

q(X,Y):-braces(X,R,2),max(R,M),N is M-1,makeListN(R,Y1,N),removeBraces(Y1,Y).
