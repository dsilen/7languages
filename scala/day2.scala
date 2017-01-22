// hitta saker
// =============
// Filer hur det funkar "diskussion"
// tex http://stackoverflow.com/questions/1284423/read-entire-file-in-scala
// => val lines = scala.io.Source.fromFile("file.txt").getLines

// Skillnad closure vs code block
// http://stackoverflow.com/questions/1812401/exactly-what-is-the-difference-between-a-closure-and-a-block
// block bara block. Closure ett objekt. Mer som en anonym funktion i Scalas version.
// val c = { println "hej" }
// c.call
// // funkar inte längre. Dvs bull. En closure är i praktiken en anonym inline funktion som har implicita parametrar, de som finns i blocket utanför.

// joxa med foldLeft
// =============
val list = List("123","12345","1234")

def countAllChars(ls:List[String]) =
    ls.foldLeft(0)((sum,l) => l.length + sum)

def alternateSyntax(ls:List[String]) =
    (0 /: ls)((sum,l) => l.length + sum)

countAllChars(list)
//scala> countAllChars(list)
//res3: Int = 12


// Censor trait
// =============

trait Censor {
    var synonyms =
        Map("shoot" -> "darn",
            "pucky" -> "bearns")

    def censor(sentence:String):String =
        synonyms
            .keys
            .foldLeft(sentence)((s,key) =>
                key.r.replaceAllIn(s, synonyms(key)))
    
    def loadSynonymsFromFile(filename:String) = {
        val source = scala.io.Source.fromFile(filename)
        val lines = source.getLines
        val emptyMap = Map[String,String]()
        synonyms = lines.foldLeft(emptyMap)((s,l) => {
            val (k::v::rest) = l.split(",").toList
            s + (k -> v)
        })
        source.close // Using!?!
    }
}


class Foo extends Censor {
}
val x = new Foo()
x.censor("yada blah shoot shoot pucky  yada.")

class Bar extends Censor {
    loadSynonymsFromFile("synonyms.txt")
}
val y = new Bar()
y.censor("yada blah shoot shoot pucky  yada hej.")







println(countAllChars(list))
println(x.censor("yada blah shoot shoot pucky  yada."))
println(y.censor("yada blah shoot shoot pucky  yada hej."))
