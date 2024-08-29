//
//  GFTitleLabel.swift
//  GHfallowers
//
//  Created by Fen on 31/07/2024.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    en rendant cet autre init conveniance, on utilise aussi l'init principal, on doit donc utiliser self et non super
    convenience init(textAlignment : NSTextAlignment, fontSize : CGFloat){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize,weight: .bold)
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
