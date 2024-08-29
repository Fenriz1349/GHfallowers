//
//  GFTextField.swift
//  GHfallowers
//
//  Created by Fen on 31/07/2024.
//

import UIKit

class GFTextField: UITextField {

    override init(frame : CGRect){
        super.init(frame: frame)
        configure()
    }

    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
//        abrege le text si il est trop long
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
//        ajout d'un bouton pour supprimer tout le champ du texfield
        clearButtonMode = .whileEditing
        placeholder = "Enter a Username"
    }
}
