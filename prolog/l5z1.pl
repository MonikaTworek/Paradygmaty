path(X, Y):- 
	path(X,Y,[]).

%path(X, X, _):-
%	true.
path(X, Y, _):- 
	arc(X,Y).
path(X, Y, V):- 
	\+ member(X, V),
	arc(X, Z),
	path(Z, Y, [X|V]).

arc(a,b).
arc(a,d).
arc(b,e).
arc(b,c).
arc(d,e).
arc(d,g).
arc(c,f).
arc(e,h).
arc(g,h).
arc(e,f).
arc(f,i).
arc(h,i).
