//
//  HomeViewControllerDataSource.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/21/21.
//

import UIKit

enum Section {
    case main
}

class HomeViewControllerDataSource:UICollectionViewDiffableDataSource<Section, MovieViewModel> {
    
    var movieManager: MovieManager
    
    init(collectionView: UICollectionView, movieManager: MovieManager = MovieManager()) {
        self.movieManager = movieManager
        super.init(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell
            cell?.movieViewModel = item
            return cell
        }
        applyData()
    }
    
    func applyData(animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MovieViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movieManager.movies, toSection: .main)
        apply(snapshot, animatingDifferences: animated)
    }
}
