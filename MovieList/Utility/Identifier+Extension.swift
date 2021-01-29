//
//  Identifier+Extension.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/22/21.
//

import UIKit

protocol Identifier {
    static var reuseIdentifier: String { get }
}

extension Identifier {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Identifier { } 
