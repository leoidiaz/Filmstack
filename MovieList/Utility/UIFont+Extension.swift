//
//  UIFont+Extension.swift
//  MovieList
//
//  Created by Leonardo Diaz on 1/28/21.
//

import UIKit

extension UIFont {
    static func customFont(name: String = "HelveticaNeue-Medium", textStyle: TextStyle) -> UIFont {
        return UIFont(name: name, size: UIFont.preferredFont(forTextStyle: textStyle).pointSize) ?? UIFont.preferredFont(forTextStyle: textStyle)
    }
}
