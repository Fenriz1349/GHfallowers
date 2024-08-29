//
//  GFEmptyStateView.swift
//  GHfallowers
//
//  Created by Fen on 27/08/2024.
//

import UIKit

class GFEmptyStateView: UIView {

    let messeageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messeageLabel.text = message
    }
    private func configure() {
        addSubview(messeageLabel)
        addSubview(logoImageView)
        
        messeageLabel.numberOfLines = 3
        messeageLabel.textColor = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messeageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messeageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messeageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messeageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
    }
}
