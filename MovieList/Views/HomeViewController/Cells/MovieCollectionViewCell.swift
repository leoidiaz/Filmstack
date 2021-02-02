//
//  MovieCollectionViewCell.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/22/21.
//

import UIKit
import SnapKit

class MovieCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    lazy var background = UIImageView()
    
    var movieViewModel: MovieViewModel? {
        didSet{
            configureCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Helper Methods
    func configureCell() {
        guard let movieView = movieViewModel  else { return }
        background.contentMode = .scaleToFill
        background.image = movieView.background
    }
    
    func layout(){
        background.snp.makeConstraints { (make) in
            make.height.equalTo(snp.width).dividedBy(2)
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
