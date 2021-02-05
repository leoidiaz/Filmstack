//
//  MovieDetailsView.swift
//  MovieList
//
//  Created by Leonardo Diaz on 2/4/21.
//

import UIKit
import SnapKit

class MovieDetailsView: UIView {
    //MARK: - Properties
    lazy var posterImage = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var directorLabel = UILabel()
    lazy var releaseLabel = UILabel()
    lazy var watchButton = UIButton()
    lazy var labelStack = UIStackView()
    lazy var imageStack = UIStackView()

    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MovieDetailsView {
    
    private func setupViews() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.customFont(textStyle: .title1)
        titleLabel.adjustsFontSizeToFitWidth = true
   
        directorLabel.numberOfLines = 0
        directorLabel.font = UIFont.customFont(textStyle: .title1)
        
        releaseLabel.font = UIFont.customFont(textStyle: .title2)
        
        watchButton.setTitle("Watch Now", for: .normal)
        watchButton.titleLabel?.font = UIFont.customFont(textStyle: .body)
        watchButton.backgroundColor = .label
        watchButton.setTitleColor(.systemBackground, for: .normal)
        
        
        posterImage.clipsToBounds = true
        posterImage.layer.cornerRadius = 2
        posterImage.contentMode = .scaleToFill
        
        
        addSubview(titleLabel)
        addSubview(labelStack)
        addSubview(imageStack)
        addSubview(posterImage)
        addSubview(watchButton)

        labelStack.alignment = .leading
        labelStack.axis = .vertical
        labelStack.distribution = .fillEqually
        labelStack.addArrangedSubview(directorLabel)
        labelStack.addArrangedSubview(releaseLabel)
        
        imageStack.alignment = .center
        imageStack.axis = .horizontal
        imageStack.distribution = .fill
        imageStack.spacing = 15
        imageStack.addArrangedSubview(labelStack)
        imageStack.addArrangedSubview(posterImage)
        
    }
    
    private func setupLayout(){
        posterImage.snp.makeConstraints { (make) in
            make.width.equalTo(125)
            make.height.equalTo(205)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        
        imageStack.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        watchButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(snp.bottomMargin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
        }
    }
}
