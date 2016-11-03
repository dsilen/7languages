#!/usr/bin/env io

##
# Fibonacci

# "Vanlig"
fib2 := method(n,
    rm1 := 1 ;
    r := 1;
    for(i,3,n,
        t := r;
        r := t + rm1;
        rm1 := t;
    );
    r)

# Loop
fib3 := method(n,
    rm1 := 1;
    r := 1;
    i := 3;
    loop(
        t := r;
        r := t + rm1;
        rm1 := t;        
        if(i >= n, break(r), i := i + 1)
    ))

# Rekursiv
fib := method(n, if(n < 3, 1, fib(n - 1) + fib(n - 2)))

##
# Denominator
Number div := Number getSlot("/")
Number / = method(n, if(n == 0, 0, self div(n)))

##
# Add numbers array of array
sumArrArr := method(lls, lls flatten sum)

##
# My average
myAverage := method(ls,
    sum := ls sum;
    num := ls size;
    sum / num)

# kastar exception om inga element
# bonus kolla om nåt inte nummer och kasta exception isåfall:
myAverage2 := method(ls,
    if(ls detect(i,v,v proto != 0) != nil, Exception raise("Detected non number"))
    ls sum / ls size)

# Bra att ha sak: introspection: getSlot("myAverage2") code

##
# matrix prototype

Matrix := List clone
Matrix dim := method(x,y,
    m := self clone;
    m empty;
    for(i,1,y,m push(list() setSize(x))))
Matrix set := method(x,y,value,
    self at(y) atPut(x,value); self)
Matrix get := method(x,y,
    self at(y) at(x))
Matrix transpose := method(
    y := self at(0) size;
    x := self size;
    ny := self dim(x,y);
    for(i,0,y-1,
        for(j,0,x-1,
            ny set(j, i, self get(i, j))));
    ny)
Matrix save := method(filename,
    f := File clone openForUpdating(filename);
    f write(self asString,"\n");
    f close;
    true)
Matrix load := method(filename,
    lls := doFile(filename);
    lls setProto(Matrix))

test1 := Matrix dim(3,4)
test1 set(0,3,123)
test2 := test1 transpose
test2 get(3,0)
test1 save("testfil2.txt")
test3 := Matrix load("testfil.txt")
test3 get(0,3)

##
# Guessing game

guessingGame := method(
    writeln("Gissa mellan 1 och 100");
    answer := (( Random value * 100 ) + 1) roundDown;
    tries := 0;
    loop(
        tries = tries + 1;
        if(tries > 10, writeln("För många försök");break(answer))
        write("Gissning ",tries,":");
        guess := File standardInput readLine asNumber;
        if(guess == answer,writeln("Du gissade rätt");break(answer));
        if(guess < answer, writeln("För litet"), writeln("För stort"))))
