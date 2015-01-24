//MARK:1. Defining a Class Hierarchy for Type Casting 
class MediaItem {
    var name: String
    init(name: String){
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String,director: String){
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String){
        self.artist = artist
        super.init(name: name)
    }
}
var library = [
    Movie(name: "后会无期", director: "韩寒"),
    Song(name: "天亮了", artist: "韩红"),
    Movie(name: "智取威虎山", director: "徐克"),
    Song(name: "饿狼传说", artist: "张学友"),
    Song(name: "情人", artist: "beyond")
]
//MARK:2. Checking Type
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount++
    }else if item is Song {
        songCount++
    }
}
movieCount
songCount
//MARK:3. Downcasting
for item in library {
    if let movie = item as? Movie {
        println("Movie: '\(movie.name)',dir.\(movie.director)")
    }else if let song = item as? Song {
        println("Song: '\(song.name)',by \(song.artist)")
    }
}
//MARK:4. Type Casting for Any and AnyObject
//AnyObject
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Rdiley Scott")
]
for obj in someObjects {
    let movie = obj as Movie
    println("Movie:'\(movie.name)',dir.\(movie.director)")
}
for movie in someObjects as [Movie] {
    println("Movie:'\(movie.name)',dir.\(movie.director)")
}
//Any
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159265)
things.append("hello")
things.append((3.0,5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({(name: String)-> String in "hello, \(name)" })

for thing in things {
    //he cases of a switch statement use the forced version of the type cast operator (as, not as?) to check and cast to a specific type. This check is always safe within the context of a switch case statement.
    switch thing {
    case 0 as Int:
        println("zero as an Int")
    case 0 as Double:
        println("zero as a Double")
    case let someInt as Int:
        println("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        println("a positive double value of \(someDouble)")
    case is Double:
        println("some other double value that I don't want to print")
    case let someString as String:
        println("a string value of \"\(someString)\"")
    case let(x,y) as (Double,Double):
        println("an (x,y) point at \(x),\(y)")
    case let movie as Movie:
        println("a movie called '\(movie.name)',dir. \(movie.director)")
    case let stringConverter as String -> String:
        println(stringConverter("Michael"))
    default:
        println("something else")
    }
}