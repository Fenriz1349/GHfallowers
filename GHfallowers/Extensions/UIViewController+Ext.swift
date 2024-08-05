//
//  UIViewController+Ext.swift
//  GHfallowers
//
//  Created by Fen on 31/07/2024.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title : String, message : String, buttonTitle : String) {
//        permet de changer l'ordre de priorité d'exection des fonctions
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self.present(alertVC,animated: true)
        }
    }
}
