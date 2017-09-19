-module(przedszkole).
-compile(export_all).

przedszkolanka(N) -> 
	spawn(?MODULE, przedszkolanka1, [[], N]).

rodzic(Pid, What) -> 
	rpc(Pid, What).

rpc(Pid, Request) ->
	%Pid ! {self(), Request},
	Pid ! Request,
		receive
			{Pid, Response} ->
				Response
		after 3000 ->
			error
		end.

przedszkolanka1(ListaDzieci, N) ->
	receive
		%{From, {pozostaw, Dziecko}} ->
		{From, pozostaw, Dziecko} ->
			case length(ListaDzieci) < N of
				true ->
					From ! {self(), {ok, Dziecko}},
					przedszkolanka1([{From, Dziecko}|ListaDzieci], N);
				false ->
					From ! {self(), error},
					przedszkolanka1(ListaDzieci, N)
			end;
		%{From, {odbierz, Dziecko}} ->
		{From, odbierz, Dziecko} ->
			case lists:member({From, Dziecko}, ListaDzieci) of
				true ->
					From ! {self(), {ok, Dziecko}},
					przedszkolanka1(lists:delete({From, Dziecko}, ListaDzieci), N);
				false ->
					From ! {self(), error},
					przedszkolanka1(ListaDzieci, N)
			end;
		terminate ->
			ok
	end.
