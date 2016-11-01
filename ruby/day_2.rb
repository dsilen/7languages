#!/bin/env ruby

# File.Open("namn") {}
# File.Open("namn") utan block. Eller File.New("namn") synonym
# stängs automatiskt om code block. Typ using.

# hash till array till hash
{:a => :b, :c => :d}.to_a.to_h

# Can you iterate through a hash. Ja
[:a,:b].each {|x| puts x}
{:a => :b, :c => :d}.each {|x| puts x}
# => a b c d

# Stack Queue Linked List. MEN mutable. usch!
[].push(:a).pop
([] << :a << :b).pop # => :b
([] << :a << :b).shift # => :a

# skriv tal i grupper om 4 med bara each
16.times.to_a.each {|x| if x%4 == 3 then puts x else print "#{x}, " end }
# Eller
z = [3,4,5,6,3,6,8,5,4,2,6,8,1,4,9,0].zip 16.times
z.each {|x,y| if y%4 ==3 then puts x else print "#{x}, " end }
# med each_slice
[3,4,5,6,3,6,8,5,4,2,6,8,1,4,9,0].each_slice(4) {|x| p x}

####
# Träd
###
# copy paste från boken
class Tree
    attr_accessor :children, :node_name

    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block} 
    end

    def visit(&block)
        block.call self
    end
end

t = Tree.new :nisse
t.visit_all {|t| p t}

# editerat/ lagt till
class Tree
    def initialize(proto)
        a = proto.to_a.first
        @node_name = a[0]
        c = a[1].to_a.map {|x| [x].to_h} # Gör hash för varje child
        @children = c.map {|x| Tree.new x}
    end
end

b = Tree.new({:a => {:b => {},:c => {}}})
b.visit_all {|x| p x.node_name}

####
# Grep
####
def grep(fil,text)
    ls = IO.readlines(fil)
    ms = ls.select {|l| /text/.match(l)}
    ms.each {|m| puts m}
    ms
end

grep("day_2.rb","grep")
