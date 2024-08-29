//
//  UIView+Ext.swift
//  GHfallowers
//
//  Created by Fen on 29/08/2024.
//

import UIKit

extension UIView {
//    ... represente un parametre qui peut avoir un nombre inderterminé de valeurs
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
