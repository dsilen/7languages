%
% reverse a list
%
myreverse([],[]).
myreverse([A|As],Cs) :- myreverse(As,Bs), append(Bs,[A],Cs).
% myreverse([1,2,3],X).

%
% find smallest element of list
%
smallest([X],X).
smallest([X|Xs],X) :- smallest(Xs,Y), X =< Y.
smallest([X|Xs],Y) :- smallest(Xs,Y), Y < X.

%
% Sort list
%
smaller(_,[],[]).
smaller(X,[Y|Ys],[Y|Ss]) :- smaller(X,Ys,Ss), Y<X.
smaller(X,[Y|Ys],Ss) :- smaller(X,Ys,Ss), Y>=X.

equalAndLarger(_,[],[]).
equalAndLarger(X,[Y|Ys],[Y|Ss]) :- equalAndLarger(X,Ys,Ss), Y >= X.
equalAndLarger(X,[Y|Ys],Ss) :- equalAndLarger(X,Ys,Ss), Y<X.

mysort([],[]).
mysort([X|Xs],S) :- smaller(X,Xs,Smaller),
                equalAndLarger(X,Xs,Larger),
                mysort(Smaller,SortedSmaller),
                mysort(Larger,SortedLarger),
                append(SortedSmaller,[X|SortedLarger],S).
% mysort([2,1,3,2],Y).
