//
//  HeaderView.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/23/21.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    //MARK: - Properties
    lazy var mainTitleLabel = UILabel()
    lazy var scrollTitleLabel = UILabel()
    lazy var addButton = UIButton()
    lazy var accountButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
}


extension HeaderView {
    
    private func setupView(){
        mainTitleLabel.font = UIFont.customFont(textStyle: .largeTitle)
        scrollTitleLabel.font = UIFont.customFont(textStyle: .title3)
        addButton.addTarget(self, action: #selector(highlightButton(sender:)), for: .touchUpInside)
        accountButton.addTarget(self, action: #selector(highlightButton(sender:)), for: .touchUpInside)
        addButton.setImage(UIImage(systemName: "plus.rectangle.on.rectangle", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        accountButton.setImage(UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        addButton.tintColor = .label
        accountButton.tintColor = .label
        scrollTitleLabel.alpha = 0.0
        addSubview(addButton)
        addSubview(accountButton)
        addSubview(mainTitleLabel)
        addSubview(scrollTitleLabel)
    }
    
    @objc private func highlightButton(sender: UIButton){
        sender.alpha = 1.0
    }
    
    private func setLayout(){
        mainTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(10)
        }
        
        accountButton.snp.makeConstraints { (make) in
            make.trailing.greaterThanOrEqualTo(addButton).inset(40)
            make.bottom.equalTo(addButton)
        }
        
        scrollTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
