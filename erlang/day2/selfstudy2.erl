-module(selfstudy2).
-export([map_lookup/2]).
-export([total_price/1]).
-export([tic_tack/1]).
%-export([all_same/1]).

map_lookup(Key,List) ->
    Tuple = lists:keyfind(Key,1,List),
    case Tuple of
        false -> false;
        {_,Value} -> Value
    end.

%8> selfstudy2:map_lookup(yada,[{1,2},{tre,"fyra"},{yada,"yada"},{yada,"två"}]).
%"yada"
%9> 


total_price(ShoppingList) ->
    [{Item,Qty * Price} || {Item,Qty,Price} <- ShoppingList].

%13> ShoppingList = [{fisk,2,123.2},{kött,1,321.4}].
%[{fisk,2,123.2},{kött,1,321.4}]
%14> selfstudy2:total_price(ShoppingList).
%[{fisk,246.4},{kött,321.4}]
%15> 

all_combos(Board) ->
    {R1C1,R1C2,R1C3,
     R2C1,R2C2,R2C3,
     R3C1,R3C2,R3C3} = Board,
    Row1 = {R1C1,R1C2,R1C3},
    Row2 = {R2C1,R2C2,R2C3},
    Row3 = {R3C1,R3C2,R3C3},
    Col1 = {R1C1,R2C1,R3C1},
    Col2 = {R1C2,R2C2,R3C2},
    Col3 = {R1C3,R2C3,R3C3},
    Diag1 = {R1C1,R2C2,R3C3},
    Diag2 = {R3C1,R2C2,R1C3},
    [Row1,Row2,Row3,Col1,Col2,Col3,Diag1,Diag2].

all_same({X,X,X}) -> true;
all_same(_) -> false.

tic_tack(Board) ->
    AllCombos = all_combos(Board),
    Winners = lists:filter(fun(X) -> all_same(X) end,AllCombos),
    Distinct = sets:size(sets:from_list(tuple_to_list(Board))),
    case Winners of
        [{Winner,_,_}|_] -> Winner;
        _ -> if Distinct < 3 -> cat; true -> no_winner end
    end.

%selfstudy2:tic_tack({x,x,y,x,x,y,y,y,x}).

%selfstudy2:tic_tack({x,x,y,y,x,x,x,y,y}).

%selfstudy2:tic_tack({x,t,y,y,x,x,x,y,y}).
