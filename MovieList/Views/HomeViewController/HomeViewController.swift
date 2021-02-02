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
    private var headerView: HeaderView!
    private var addMovieView: AddMovieView?
    
    var headerViewTopConstraint: Constraint?
    
    var isSorted = false
    
    var layoutSize: LayoutSize = .full {
        didSet{
            collectionView.setCollectionViewLayout(configureLayout(), animated: true)
        }
    }
    
    private lazy var dataSource: HomeViewControllerDataSource = {
        return HomeViewControllerDataSource(collectionView: collectionView)
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutView()
    }
    
    //MARK: - Target Methods
    
    @objc func addFilmTapped() {
        addMovieView = AddMovieView()
        guard let addMovieView = addMovieView else { return }
        headerView.addButton.alpha = 0.5
        addMovieView.addButton.addTarget(self, action: #selector(fetchFilms), for: .touchDown)
        view.addSubview(addMovieView)
    }
    
    @objc func fetchFilms(){
        dataSource.movieManager.movies = dataSource.movieManager.createMovies
        dataSource.applyData(animated: true)
        addMovieView?.dismissView()
        headerView.addButton.isEnabled = false
    }
    
    @objc func accountButtonTapped(){
        headerView.accountButton.alpha = 0.5
    }
    
    func sortByDate(){
        if isSorted {
            dataSource.movieManager.movies.sort(by: { $0.release > $1.release })
        } else {
            dataSource.movieManager.movies.sort(by: { $0.release < $1.release })
        }
        isSorted.toggle()
        dataSource.applyData()
    }
    
    func filterMenu() -> UIMenu {
        let full = UIAction(title: "Full", image: UIImage(systemName: "rectangle.grid.1x2.fill")) { [weak self] action in
            self?.layoutSize = .full
        }
        let half = UIAction(title: "Half", image: UIImage(systemName: "square.grid.2x2.fill")) { [weak self] action in
            self?.layoutSize = .half
        }
        let release = UIAction(title: "Sort By Release", image: UIImage(systemName: "arrow.up.arrow.down.square")) { [weak self] action in
            self?.sortByDate()
        }
        let menu = UIMenu(title: "", children: [full, half, release])
        return menu
    }
    
    //MARK: - Helper Methods
    
    private func setupView(){
        view.backgroundColor = .systemBackground
        headerView = HeaderView()
        headerView.mainTitleLabel.text = "Filmstack"
        headerView.scrollTitleLabel.text = headerView.mainTitleLabel.text
        headerView.addButton.addTarget(self, action: #selector(addFilmTapped), for: .touchDown)
        headerView.accountButton.addTarget(self, action: #selector(accountButtonTapped), for: .touchDown)
        headerView.accountButton.menu = filterMenu()
        view.addSubview(headerView)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    
    func configureLayout() -> UICollectionViewLayout {
        let insets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(layoutSize.rawValue), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets  = insets
        
        var amount: CGFloat
        amount = layoutSize == .full ? 0.5 : 0.3
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(amount))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let config = UICollectionViewCompositionalLayout(section: section)
        return config
    }
    
    private func layoutView(){
        headerView.snp.makeConstraints { (make) in
            headerViewTopConstraint = make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).constraint
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
//MARK: - TableViewDelegate & ScrollViewDelegate
extension HomeViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieView = dataSource.itemIdentifier(for: indexPath) else { return }
        let destinationVC = MovieDetailViewController(movieViewModel: movieView)
        present(destinationVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let swipingDown = y <= 0
        let shouldSnap = y > 1
        let labelHeight = headerView.mainTitleLabel.frame.height - 40
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.headerView.mainTitleLabel.alpha = swipingDown ? 1.0 : 0.0
            self.headerView.scrollTitleLabel.alpha = swipingDown ? 0.0 : 1.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations:  { [weak self] in
            guard let self = self else { return }
            self.headerViewTopConstraint?.layoutConstraints[0].constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        })
    }
}
