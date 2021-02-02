//
//  MovieManager.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/22/21.
//

import UIKit

class MovieManager {
    var movies = [MovieViewModel]()
    var createMovies: [MovieViewModel] = {
        [
            MovieViewModel(movie: Movie(title: "In The Mood For Love", director: "Wong Kar-wai", releaseDate: "2000", backgroundImage: UIImage(named: "background1")!, posterImage: UIImage(named: "poster1")!)),
            MovieViewModel(movie: Movie(title: "Jaws", director: "Steven Spielberg", releaseDate: "1975", backgroundImage: UIImage(named: "background2")!, posterImage: UIImage(named: "poster2")!)),
            MovieViewModel(movie: Movie(title: "Y Tu Mamá También", director: "Alfonso Cuarón", releaseDate: "2002", backgroundImage: UIImage(named: "background3")!, posterImage: UIImage(named: "poster3")!)),
            MovieViewModel(movie:  Movie(title: "Psycho", director: "Alfred Hitchcock", releaseDate: "1960", backgroundImage: UIImage(named: "background4")!, posterImage: UIImage(named: "poster4")!)),
            MovieViewModel(movie:  Movie(title: "Memories of Murder", director: "Bong Joon-ho", releaseDate: "2003", backgroundImage: UIImage(named: "background5")!, posterImage: UIImage(named: "poster5")!)),
            MovieViewModel(movie:  Movie(title: "Drive", director: "Nicolas Winding Refn", releaseDate: "2011", backgroundImage: UIImage(named: "background6")!, posterImage: UIImage(named: "poster6")!))
        ]
    }()
}
