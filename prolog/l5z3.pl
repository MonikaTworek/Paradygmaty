sieve(N,X):-
    sieve2(S,X),
    numlist(2,N,S).

sieve2(S,P):-
    freeze(S,
        (   S =[H|T]
		->  P = [H|P_],
			filter(H,T,Z),
            sieve2(Z,P_)
		;	P = []
        )).

filter(H,S,Y):-
	freeze(S,
		(	S = [H1|T]
		-> (H1 mod H =\= 0 
			->  Y = [H1|Y_],
				filter(H,T,Y_)
			;
				filter(H,T,Y)
			)
		;	Y = []
		)).
