//
//  MovieViewModel.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/22/21.
//

import UIKit

struct MovieViewModel: Hashable {
    
    //MARK: - Properties
    var movie: Movie
    
    var title: String {
        return movie.title
    }
    
    var director: String {
        return movie.director
    }
    

    var release: String {
        return movie.releaseDate
    }
    
    var background: UIImage {
        return movie.backgroundImage
    }
    
    var posterImage: UIImage {
        return movie.posterImage
    }
}
