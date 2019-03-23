class MediaItem {
    var name: String

    init(name: String){
        self.name = name
    }
}

class Movie: MediaItem, CustomStringConvertible {
    var director: String
    var description: String{
        return "\(super.name)  dirigida por \(director)" 
    }

    init(name: String,directorName director: String) {
        self.director = director
        super.init(name: name)
    }

}

class Song: MediaItem,CustomStringConvertible {
    var artist: String
    var description: String {
        return "\(super.name), el artista \(artist)"
    }

    init(name: String,artistName artist: String){
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "the lack" ,directorName: "James Lock"),
    Movie(name: "josefina cladio" ,directorName: "juan pablo"),
    Song(name: "Faint",artistName: "Linking Park"),
    Song(name:"Hero",artistName: "Nickelback"),
    Song(name: "no frauds",artistName: "Nicky Minaj")
    ]


var amountOfMoviesInLibrary = 0
var amountOfSongsInLibrary = 0

for item in library {
    if item is Movie {
        amountOfMoviesInLibrary += 1
    }else if item is Song {
        amountOfSongsInLibrary += 1
    }
}

print("There are \(amountOfMoviesInLibrary) movies and \(amountOfSongsInLibrary)  Songs in the library")
print("Media files in the library")
print("")

for item in library {
    if let movie = item as? Movie{
        print("\(movie)")
    }else if let song = item as? Song {
        print("\(song)")
    }
}

