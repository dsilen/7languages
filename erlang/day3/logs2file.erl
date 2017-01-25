-module(logs2file).

-behaviour(gen_server).

-export([start/1, stop/0]).
-export([init/1, handle_call/3, handle_cast/2]).
-export([terminate/2]).

-export([log/1]).


print(X) -> io:format("~p~n",[X]).

% klient metoder
% ===========
start(Filnamn) ->
    gen_server:start_link({local, logs2file}, logs2file, Filnamn, []).

log(X) -> gen_server:cast(logs2file, {log2,X}).

stop() -> gen_server:cast(logs2file, stop).

% server metoder
% ===========
init(Filename) ->
    print("starting"),
    {ok, FD} = file:open(Filename, [append]),
    {ok, FD}. % state = FD

terminate(normal, FD) ->
    print("Stopping"),
    file:close(FD),
    ok.

% == handle synchronous call
handle_call(_, _From, State) ->
    {reply, rpy, State}. % noop

% == handle async call
handle_cast({log2, X}, FD) ->
    print(X),
    io:fwrite(FD,"~p~n",[X]),
    {noreply, FD};

handle_cast(stop,State) ->
    {stop,normal,State}.
