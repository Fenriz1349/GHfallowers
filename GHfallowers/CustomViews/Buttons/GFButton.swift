//
//  GFButton.swift
//  GHfallowers
//
//  Created by Fen on 31/07/2024.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
       configure()
    }
    
    
    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(color : UIColor,title : String, systemImageName: SFNames) {
        self.init(frame: .zero)
        set(color: color, title: title,systemImageName: systemImageName)
    }
    
    
    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }

    
    final func set(color : UIColor, title : String, systemImageName : SFNames) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .black
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImageName.rawValue)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}
