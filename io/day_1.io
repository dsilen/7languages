#!/usr/bin/env io

Vehicle := Object clone

# assignment
Vehicle description := "Takes you places"

# updates
Vehicle description = "Takes you far away"

Vehicle slotNames
Vehicle type

Car := Vehicle clone
Car slotNames
#==> list(type)
# borde den inte ha med description?! Nej justja, slotNames visar bara explicita


ferrari := Car clone
ferrari slotNames

Car drive := method("Vroom" println)

ferrari drive
#==> Vroom # (!). Den ärver ju så får med

ferrari getSlot("drive")

Car proto
ferrari proto

# Lista slotnames från File
Protos Core File slotNames

## Dagens uppgifter

## starkt typat?
#1 + "1"
#==> Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
#starkt

## är 0 true?
true and 0
#==> true
#Allt utom nil och false verkar det

## Vilka slotnames i prototyp
#slotNames meddelande
Object slotNames
Protos Core File slotNames

## difference between = := och ::=
#= ändra slot, måste finnas
#:= skapa slot (eller ändra)
#::= skapa slot och setter.
#setter är möjlighet köra message så här
Nisse := Object clone
Nisse yada ::= 1
Nisse setYada 2

# kör kod i slot
Nisse kod := method("hej" print)
Nisse kod

#Kör en Fil
# io day_1.io