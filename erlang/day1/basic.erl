-module(basic).
-export([mirror/1]).

mirror(Anything) -> Anything.
%1> c(basic).
%{ok,basic}
%2> basic:mirror(1).
%1
%3> 
