-module(selfstudy).
-export([words_in_string/1]).
-export([count_to_ten/0]).
-export([print_success/1]).

% Home of erlang: http://www.erlang.org/

% Official documentation: http://www.erlang.org/docs

% Documentation of OTP: http://erlang.org/doc/search/

words_in_string("") -> 0;
words_in_string([_|T]) -> 1 + words_in_string(T).

count_to_ten(10) -> 10;
count_to_ten(N) -> io:format("~p\n",[N]),
                   count_to_ten(N+1).
count_to_ten() -> count_to_ten(1).

print_success({error,Message}) -> io:format("error: ~p\n",[Message]);
print_success({success,_}) -> io:put_chars("success\n").

%29> selfstudy:print_success({success,123}).
%success
%ok
%30> selfstudy:print_success({error,"felmeddelande"}).
%error: "felmeddelande"
%ok
%31> 
