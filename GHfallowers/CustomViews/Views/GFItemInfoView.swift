//
//  GFItemInfoView.swift
//  GHfallowers
//
//  Created by Fen on 28/08/2024.
//

import UIKit

enum ItemInfoType {
    
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countlabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(symbolImageView, titleLabel, countlabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countlabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countlabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType : ItemInfoType,withCount count: Int) {
        switch itemInfoType {
        case .repos :
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = "Repos Publiques"
        case .gists :
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = "Gists publiques "
        case .followers :
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following :
            symbolImageView.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        countlabel.text = count.description
    }
}
