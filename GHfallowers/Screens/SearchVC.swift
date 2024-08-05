//
//  SearchVC.swift
//  GHfallowers
//
//  Created by Fen on 31/07/2024.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let getFollowerButton = GFButton(backgroundColor: .systemGreen, title: "Get Fallowers")
    
    var isUsernameEntered : Bool { return !usernameTextField.text!.isEmpty }
//    configure la view à sa création
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureGetFollowerButton()
        createDismissKeyboardTapGesture()
    }
    
//    configure la view à chaque apparition
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureLogoImageView(){
//        ajoute l'image à la view
        view.addSubview(logoImageView)
//        permet d'utiliser autoconstraint
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
//        indique quelle image des assests utiliser, préféré les constantes au lieu d'une String
        logoImageView.image = UIImage(named: "gh-logo")!
//        Array des constraints de l'image, ici la top anchor, le centrage horizontale, la hauteur et la largeur
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        usernameTextField.becomeFirstResponder()
    }
    
    func configureGetFollowerButton() {
        view.addSubview(getFollowerButton)
        getFollowerButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getFollowerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getFollowerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            getFollowerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            getFollowerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
//    fonction pour supprimer le clavier en touchant l'écran
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersListVC(){
        guard isUsernameEntered else{
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀.", buttonTitle: "OK")
            return
        }
        let followerListVC = FollowersListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
}


extension SearchVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
