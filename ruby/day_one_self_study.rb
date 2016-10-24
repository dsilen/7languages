#!/bin/env ruby
# Ska köras i irb

#1 Hitta The Ruby API
# http://ruby-doc.org/core-2.3.1/

#2 Hitta Programming Ruby The Pragmatic Programmer's Guide
# http://ruby-doc.com/docs/ProgrammingRuby/

#3 substitute
# "hello".sub(/l+/,"r")
# "hello".sub("l","r")

#4 regex
# http://ruby-doc.org/core-2.3.1/doc/regexp_rdoc.html

#5 Range
# http://ruby-doc.org/core-2.3.1/Range.html


print "hello, world"

"Hello, Ruby".index "Ruby"

for i in 1..10
  puts "Daniel"
end

for i in 1..10
    puts "This is sentence #{i}"
end

def guess_game
    answer = rand 10
    begin
        puts "Write a number 0..9"
        guess = gets.to_i
        puts "Too low" if guess < answer
        puts "Too high" if guess > answer        
    end while guess != answer
    answer
end
