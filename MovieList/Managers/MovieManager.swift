//
//  MovieManager.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/22/21.
//

import UIKit

class MovieManager {
    //    var allMovies: [Movie] = {[
    //        Movie(title: "In the mood for love", director: "Wong Kar-wai", releaseDate: "2000", backgroundImage: UIImage(named: "background1")!),
    //        Movie(title: "Jaws", director: "Steven Spielberg", releaseDate: "1975", backgroundImage: UIImage(named: "background2")!),
    //        Movie(title: "Y tu mamá también", director: "Alfonso Cuarón", releaseDate: "2002", backgroundImage: UIImage(named: "background3")!),
    //        Movie(title: "Psycho", director: "Alfred Hitchcock", releaseDate: "1960", backgroundImage: UIImage(named: "background4")!),
    //    ]}()
    var movies = [MovieViewModel]()
    var createMovies: [MovieViewModel] = {
        [
            MovieViewModel(movie: Movie(title: "In The Mood For Love", director: "Wong Kar-wai", releaseDate: "2000", backgroundImage: UIImage(named: "background1")!)),
            MovieViewModel(movie: Movie(title: "Jaws", director: "Steven Spielberg", releaseDate: "1975", backgroundImage: UIImage(named: "background2")!)),
            MovieViewModel(movie: Movie(title: "Y Tu Mamá También", director: "Alfonso Cuarón", releaseDate: "2002", backgroundImage: UIImage(named: "background3")!)),
            MovieViewModel(movie:  Movie(title: "Psycho", director: "Alfred Hitchcock", releaseDate: "1960", backgroundImage: UIImage(named: "background4")!)),
            MovieViewModel(movie:  Movie(title: "Memories of Murder", director: "Bong Joon-ho", releaseDate: "2003", backgroundImage: UIImage(named: "background5")!)),
            MovieViewModel(movie:  Movie(title: "Drive", director: "Nicolas Winding Refn", releaseDate: "2011", backgroundImage: UIImage(named: "background6")!))
        ]
    }()
}
