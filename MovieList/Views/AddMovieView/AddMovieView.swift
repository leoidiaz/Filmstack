//
//  AddMovieView.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/27/21.
//

import UIKit
import SnapKit

class AddMovieView: UIView {
    
    //MARK: - Properties
    lazy var container = UIView()
    lazy var closeButton = UIButton(type: .close)
    lazy var titleLabel = UILabel()
    lazy var addButton = UIButton()
    lazy var addFilmsStack = UIStackView()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        setupView()
        setupLayout()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
        animateView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Methods
    
    @objc func dismissView(){
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut) { [weak self] in
            guard let self = self else { return }
            self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        } completion: { [weak self] (_) in
            self?.subviews.forEach{$0.removeFromSuperview()}
            self?.removeFromSuperview()
        }
    }
    
    @objc func animateView(){
        container.transform = CGAffineTransform(translationX: 0, y: frame.height)
        alpha = 0.8
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) { [weak self] in
            self?.container.transform = .identity
            self?.alpha = 1
        }
    }
}
//MARK: - Setup Methods
extension AddMovieView {
    private func setupView(){
        container.layer.cornerRadius = 20
        container.backgroundColor = .secondarySystemBackground
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchDown)
        titleLabel.text = "Want to add some films?"
        titleLabel.font = UIFont.customFont(textStyle: .title2)
        addButton.setTitle("ADD", for: .normal)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.titleLabel?.font = UIFont.customFont(textStyle: .body)
        addButton.backgroundColor = .label
        addButton.layer.cornerRadius = 10
        addSubview(container)
        container.addSubview(closeButton)
        container.addSubview(addFilmsStack)
        addFilmsStack.addArrangedSubview(titleLabel)
        addFilmsStack.addArrangedSubview(addButton)
        addFilmsStack.axis = .vertical
        addFilmsStack.alignment = .center
        addFilmsStack.distribution = .fillEqually
        addFilmsStack.spacing = 15
    }
    
    private func setupLayout(){
        container.snp.makeConstraints { (make) in
            make.centerX.bottom.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.top.equalTo(container.snp.topMargin)
            make.trailing.equalTo(container.snp.trailingMargin)
        }
        
        addFilmsStack.snp.makeConstraints { (make) in
            make.center.equalTo(container)
            make.width.equalTo(container).multipliedBy(0.9)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.width.equalTo(addFilmsStack).multipliedBy(0.3)
        }
    }
}
