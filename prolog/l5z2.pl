once(X, L) :-
	append(Pref, [X|Suff], L),
	\+ member(X,Pref),
	\+ member(X,Suff).

twice(X, L) :- 
    append(Pref,[X|Suff],L), 
    \+ member(X,Pref), 
	once(X, Suff).
