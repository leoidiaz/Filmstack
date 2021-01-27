//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/22/21.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    //MARK: - Properties
    lazy var background = UIImageView()
    lazy var title = UILabel()
    
    var movieViewModel: MovieViewModel? {
        didSet{
            configureCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(background)
        addSubview(title)
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
        title.text = movieView.title
        title.font = UIFont.preferredFont(forTextStyle: .title1)
        title.textColor = .white
    }

    
    func layout(){
        background.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
        
        title.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview().offset(50)
        }
    }
}
