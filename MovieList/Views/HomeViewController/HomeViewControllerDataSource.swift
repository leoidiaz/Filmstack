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

class HomeViewControllerDataSource:UITableViewDiffableDataSource<Section, MovieViewModel> {
    var movieManager: MovieManager
    init(tableView: UITableView, movieManager: MovieManager = MovieManager()) {
        self.movieManager = movieManager
        super.init(tableView: tableView) { (tableView, indexPath, movieVM) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier) as? MovieTableViewCell else { return UITableViewCell() }
            cell.movieViewModel = movieVM
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func applyData(animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MovieViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movieManager.movies, toSection: .main)
        apply(snapshot, animatingDifferences: animated)
    }
}
