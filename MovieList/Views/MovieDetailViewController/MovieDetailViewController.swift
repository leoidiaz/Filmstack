//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Leonardo Diaz on 2/1/21.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    //MARK: - Properties
    var movieViewModel: MovieViewModel
    lazy var closeButton = UIButton(type: .custom)
    lazy var backgroundImage = UIImageView()
    lazy var movieDetailsView = MovieDetailsView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    //MARK: - Init
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Methods
    @objc func dismissView(){
      dismiss(animated: true)
    }
    
}

extension MovieDetailViewController {
    
    private func setupView(){
        view.backgroundColor = .systemBackground

        closeButton.setImage(UIImage(systemName: "xmark.square.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchDown)
        closeButton.tintColor = .white
        backgroundImage.image = movieViewModel.background
        backgroundImage.contentMode = .scaleAspectFit
        
        view.addSubview(backgroundImage)
        view.addSubview(closeButton)
        view.addSubview(movieDetailsView)

        movieDetailsView.titleLabel.text = movieViewModel.title
        movieDetailsView.directorLabel.text = movieViewModel.director
        movieDetailsView.releaseLabel.text = movieViewModel.release
        movieDetailsView.posterImage.image = movieViewModel.posterImage
    }
    
    private func setupLayout(){
        
        backgroundImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        movieDetailsView.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp.bottomMargin).offset(30)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.snp.trailingMargin)
            make.top.equalTo(view.snp.topMargin).offset(15)
        }
        
    }
}
