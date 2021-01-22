//
//  HomeViewController.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/21/21.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    
    private var collectionView: UICollectionView!
    
    private lazy var dataSource: HomeViewControllerDataSource = {
        return HomeViewControllerDataSource(collectionView: collectionView)
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MovieList"
        setupView()
        layoutView()
    }
    
    //MARK: - Helper Methods
    
    private func setupView(){
        let listLayout = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout.list(using: listLayout))
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGroupedBackground
        view.addSubview(collectionView)
        dataSource.applyData(animated: false)
    }
    
    
    private func layoutView(){
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension HomeViewController: UICollectionViewDelegate { }
