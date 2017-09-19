-module(l4z1).
-export([pythag/1]).
pythag(D) ->
	[{A,B,C} ||
		A <- lists:seq(1, (D div 3) - 1),
		B <- [(D*((D div 2) - A)) div (D - A)],
		C <- [D-A-B],
		A < B,
		A*A + B*B == C*C].