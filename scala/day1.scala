// testar lite jox först
def whileloop() {
    println("En whileloop")
    var i = 0 // var == mutable variabel
    while(i < 3) {
        println(i)
        i += 1
    }
}

def forloop() {
    println("En forloop")
    for(i <- 0 until 3) { // forloopar jobbar med ranges: 0 until 3
        println(i)
    }
}

// ranges mer
// 0 to 3 including
// 0 until 3 nonincluding
// 1 to 4 by 2
// 'a' until 'e'

def forloop_chars() {
    println("En forloop över char range med step 2")
    for(c <- 'a' to 'z' by 2) {
        println(c)
    }
}

val tupel = (1,"ett")
// tupel._2 => "ett"

val (fst,snd) = tupel // pattern matching

// Klasser
class Person(firstName:String, lastName:String) {
    val nisse = firstName
}

// Companion object. och singleton
object Person {
    def aSingleton() {
        println("hejhopp")
    }
}

val p = new Person("Nisse","Tuta")

println(p.nisse)
Person.aSingleton()

// Dagens uppgift på riktigt

class TicTac(r1c1:String,r1c2:String,r1c3:String
    ,r2c1:String,r2c2:String,r2c3:String
    ,r3c1:String,r3c2:String,r3c3:String) {
    val empty = ""

    def weHaveAWinner:(Boolean,String) = {
        val row1 = (r1c1,r1c2,r1c3)
        val row2 = (r2c1,r2c2,r2c3)
        val row3 = (r3c1,r3c2,r3c3)
        val col1 = (r1c1,r2c1,r3c1)
        val col2 = (r1c2,r2c2,r3c2)
        val col3 = (r1c3,r2c3,r3c3)
        val diag1 = (r1c1,r2c2,r3c3)
        val diag2 = (r3c1,r2c2,r1c3)

        val allCombos = List(row1,row2,row3,
            col1,col2,col3,
            diag1,diag2)

        def allSame(x:String,y:String,z:String):Boolean = 
            { return x == y && y == z }

        for(i <- allCombos) {
            val (x,y,z) = i
            if(allSame(x,y,z) && x != empty)
                return (true,x)
        }
        return (false,empty)
    }
}

val x = new TicTac(
                    "x","","",
                    "x","","",
                    "x","","")
x.weHaveAWinner

val y = new TicTac(
                    "x","","y",
                    "x","y","",
                    "y","","x")
y.weHaveAWinner

val z = new TicTac(
                    "x","x","y",
                    "y","y","x",
                    "x","y","x")
z.weHaveAWinner
