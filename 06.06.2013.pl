nat(3).
nat(X):-nat(Y),X is Y+1.

divisors(N,D):-between(1,N,D),X is N mod D, X==0.

maxM(X,M):-sqrt(X,R),ceiling(R,M).

maxN(X,N):-log(X,M),log(2,P),Q is M/P,ceiling(Q,N).

isOfKind(X):-not((not((maxM(X,M),maxN(X,N),between(0,N,N1),between(0,M,M1),pow(2,N1,Y),Z is M1*M1*M1,U is Y+Z,X==U)))).

p(N,M):-divisors(N,M),isOfKind(M).

%---------------------------------------------------------------

sixes(Y1,Y2,Y3,X1,X2,X3):-nat(S),S1 is S-2,between(1,S1,Y1),S2 is S-Y1-1,between(1,S2,Y2),S3 is S-Y1-Y2,between(1,S3,Y3),S4 is S3-Y3,between(0,S4,X1),S5 is S4-X1,between(0,S5,X2),X3 is S5-X2.

p([X,Y]):-sixes(Y1,Y2,Y3,X1,X2,X3),A is X1*X1*Y2*Y2*Y3*Y3,B is X2*X2*Y1*Y1*Y3*Y3,C is X3*X3*Y2*Y2*Y1*Y1,Y is Y1*Y1*Y2*Y2*Y3*Y3,X is A+B+C.

