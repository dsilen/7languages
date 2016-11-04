#!/usr/bin/env io

##
# Xml Builder

# copy paste från boken
Builder := Object clone
Builder forward := method(
    writeln("<", call message name, ">");
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(content)))
    writeln("</", call message name, ">"))


# omarbetat så den fixar indentering
Builder := Object clone
Builder indentation := ""
Builder forward := method(
    writeln(indentation,"<", call message name, ">");
    savedInd := self indentation;
    self indentation = self indentation cloneAppendSeq("  ");
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(content)));
    self indentation = savedInd;
    writeln(indentation,"</", call message name, ">"))

##
# List bracket syntax
squareBrackets := method(
    ls := list();
    call message arguments foreach(arg,
        ls push(evalArg(arg)));
    ls)

##
# XML programmet med attribut som curlyBrackets

# curlyBrackets copy paste
OperatorTable addAssignOperator(":","atPutNumber")
curlyBrackets := method(
    r := Map clone;
    call message arguments foreach(arg,
        r doMessage(arg));
    r)
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)))


# xml grunken moddad så det ska funka
Builder := Object clone
Builder indentation := ""
Builder forward := method(
    write(indentation,"<", call message name);
    attrsAsString := method(m,
        ls := list();
        m foreach(k,v,
            ls push( k asMutable appendSeq("=\"",v,"\"")));
        ls join(", "));
    args := call message arguments;
    if(args isEmpty not,
        if(args at(0) asString findSeq("curlyBrackets") == 0,
            write(" ",attrsAsString(call evalArgAt(0)));
            args removeFirst);
        writeln(">");
        savedInd := self indentation;
        self indentation = self indentation cloneAppendSeq("  ");
        args foreach(arg,
            content := self doMessage(arg);
            if(content type == "Sequence", writeln(content)));
        self indentation = savedInd;
    )
    writeln(indentation,"</", call message name, ">"))

Builder ul({"apa":"bepa","nisse":"tuta"},li("Io"),li("Lua"),li("JavaScript"))

# hur skriver man tomrader inne i en funktion?
# dito kommentarer? Inte orkat kolla efter.
# Inte snyggaste koden den sista direkt, men den funkar.
