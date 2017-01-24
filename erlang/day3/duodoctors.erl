-module(duodoctors).
-export([setup/0]).
-export([kill_doctor1/0]).
-export([kill_doctor2/0]).

print(X) -> io:format("~p~n",[X]).

doctor1() ->
    process_flag(trap_exit, true),
    receive
        {'EXIT',_,_} ->
            print("Dying doctor2 caught."),
            self() ! new,
            doctor1();
        new ->
            print("Creating doctor2."),
            NewDoc = spawn_link(fun doctor2/0),
            register(doctor2, NewDoc),
            doctor1();
        die ->
            print("Doctor1 dying."),
            exit(dying1)
    end.
            
doctor2() ->
    process_flag(trap_exit, true),
    receive
        {'EXIT',_,_} ->
            print("Dying doctor1 caught."),
            self() ! new,
            doctor2();
        new ->
            print("Creating doctor1."),
            NewDoc = spawn_link(fun doctor1/0),
            register(doctor1, NewDoc),
            doctor2();
        die ->
            print("Doctor2 dying."),
            exit(dying2)
    end.
            


setup() ->
    Doc1 = spawn(fun doctor1/0),
    Doc1 ! new,
    register(doctor1, Doc1),
    Doc1.


kill_doctor1() -> doctor1 ! die.
kill_doctor2() -> doctor2 ! die.
