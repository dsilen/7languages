-module(selfstudy3).
-export([setup_monitor/0]).
-export([translate/1]).

% hitta OTP Monitor
% http://erlang.org/doc/design_principles/sup_princ.html

% OTP server
% http://erlang.org/doc/design_principles/gen_server_concepts.html

% bonus regga globalt: http://erlang.org/doc/man/global.html global:register(...)

print(X) -> io:format("~p~n",[X]).


dying_translate_service() ->
    receive
        {From, "casa"} ->
            From ! "house",
            dying_translate_service();
        {From, "blanca"} ->
            From ! "white",
            dying_translate_service();
        {From, _} ->
            From ! "I don't understand.",
            dying_translate_service();
        diediedie ->
            print("Translator dying!"),
            exit(dead)
    end.

translate(Word) ->
    translator ! {self(), Word},
    receive
        Translation -> Translation
    end.

translator_monitor() ->
    process_flag(trap_exit, true),
    receive
        {'EXIT',_,_} ->
            print("Dying translator caught."),
            self() ! new,
            translator_monitor();
        new ->
            print("Creating new translator."),
            NewTranslator = spawn_link(fun dying_translate_service/0),
            register(translator, NewTranslator),
            translator_monitor();
        exit ->
            print("Monitor exiting"),
            exit(yada)
    end.

setup_monitor() ->
    Monitor = spawn(fun translator_monitor/0),
    Monitor ! new,
    Monitor.

%Monitor = selfstudy3:setup_monitor().
%selfstudy3:translate("casa").
%translator ! diediedie.
%Monitor ! exit.
%self() ! "fusk".
%flush().




