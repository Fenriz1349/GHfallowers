//
//  GFButton.swift
//  GHfallowers
//
//  Created by Fen on 31/07/2024.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        //        appelle toute l'init de base de UIButton
        super.init(frame: frame)
       configure()
    }
    
    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor : UIColor,title : String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
