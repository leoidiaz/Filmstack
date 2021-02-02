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
    lazy var posterImage = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var directorLabel = UILabel()
    lazy var releaseLabel = UILabel()
    lazy var watchButton = UIButton()
    lazy var labelStack = UIStackView()
    lazy var imageStack = UIStackView()
    
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
        view.addSubview(titleLabel)
        view.addSubview(labelStack)
        view.addSubview(imageStack)
        view.addSubview(posterImage)
        view.addSubview(closeButton)
        view.addSubview(watchButton)
        
        titleLabel.text = movieViewModel.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.customFont(textStyle: .title1)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        directorLabel.text = movieViewModel.director
        directorLabel.numberOfLines = 0
        directorLabel.font = UIFont.customFont(textStyle: .title1)
        
        releaseLabel.font = UIFont.customFont(textStyle: .title2)
        releaseLabel.text = movieViewModel.release
        
        watchButton.setTitle("Watch Now", for: .normal)
        watchButton.backgroundColor = .label
        watchButton.setTitleColor(.systemBackground, for: .normal)
        
        
        labelStack.alignment = .leading
        labelStack.axis = .vertical
        labelStack.distribution = .fillEqually
        labelStack.addArrangedSubview(directorLabel)
        labelStack.addArrangedSubview(releaseLabel)
        
        posterImage.image = movieViewModel.posterImage
        posterImage.clipsToBounds = true
        posterImage.layer.cornerRadius = 2
        posterImage.contentMode = .scaleToFill
        
        imageStack.alignment = .center
        imageStack.axis = .horizontal
        imageStack.distribution = .fill
        imageStack.spacing = 15
        imageStack.addArrangedSubview(labelStack)
        imageStack.addArrangedSubview(posterImage)
    }
    
    private func setupLayout(){
        
        backgroundImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        posterImage.snp.makeConstraints { (make) in
            make.width.equalTo(125)
            make.height.equalTo(205)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.top.equalTo(backgroundImage.snp.bottomMargin).offset(30)
        }
        
        
        imageStack.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.snp.trailingMargin)
            make.top.equalTo(view.snp.topMargin).offset(15)
        }
        
        watchButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottomMargin).offset(-50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
    }
}
