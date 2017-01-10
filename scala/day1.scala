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
