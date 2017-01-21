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

class TicTac {
    val e = ""
    val x = "X"
    val y = "Y"
    var board = (e,e,e,e,e,e,e,e,e)

    var (r1c1,r1c2,r1c3,r2c1,r2c2,r2c3,r3c1,r3c2,r3c3) = board

    var row1 = (r1c1,r1c2,r1c3)
    var row2 = (r2c1,r2c2,r2c3)
    var row3 = (r3c1,r3c2,r3c3)
    var col1 = (r1c1,r2c1,r3c1)
    var col2 = (r1c2,r2c2,r3c2)
    var col3 = (r1c3,r2c3,r3c3)
    var diag1 = (r1c1,r2c2,r3c3)
    var diag2 = (r3c1,r2c2,r1c3)

    var allCombos = List(row1,row2,row3,col1,col2,col3,diag1,diag2)

    def weHaveAWinner:Boolean = {
        // kolla om nån av sakerna i allCombos är alla samma
        def allSame(x:String,y:String,z:String):Boolean = 
            { return x == y && y == z }

        for(i <- allCombos) {
            var (x,y,z) = i
            if(allSame(x,y,z))
                return true
        }
        return false
    }
}
