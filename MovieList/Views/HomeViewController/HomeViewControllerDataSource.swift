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

class HomeViewControllerDataSource:UICollectionViewDiffableDataSource<Section, Movie> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { (collectionView, indexPath, movie) -> UICollectionViewCell? in
            let cellConfiguration = UICollectionView.CellRegistration<UICollectionViewListCell, Movie> { (cell, indexPath, movie) in
                var content = cell.defaultContentConfiguration()
                content.text = movie.title
                cell.contentConfiguration = content
            }
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellConfiguration, for: indexPath, item: movie)
            return cell
        }
    }
    
    func applyData(animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        apply(snapshot, animatingDifferences: animated)
    }
}
