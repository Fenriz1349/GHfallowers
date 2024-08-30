//
//  Constants.swift
//  GHfallowers
//
//  Created by Fen on 28/08/2024.
//

import UIKit

enum SFSymbols {
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName: "folder")
    static let gists = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName: "heart")
    static let following = UIImage(systemName: "person.2")
}

enum GFImages {
    static let ghlogo = UIImage(named: "gh-logo")
    static let placeholder = UIImage(named: "avatar-placeholder")
    static let emptyStateLogo = UIImage(named: "empty-state-logo")
}

enum GFAlertTitles {
    static let invalidUsername = "Nom d'utilisateur vide"
    static let somethingWentWrong = "Une erreur est survenue"
    static let unableToDelete = "Impossible de supprimer"
    static let sucess = "Succès!"
    static let invalidURL = "URL Invalide"
    static let noFollower = "Aucun Followers"
}
enum GFError : String,Error {
    case invalidUsername = "Ce nom d’utilisateur a créé une requête invalide, veuillez réessayer"
    case unableToComplete = "Impossible de compléter votre requête. Veuillez vérifier votre connexion Internet."
    case invalidResponse = "Réponse invalide du serveur. Veuillez réessayer."
    case invalidData = "Les données reçues du serveur sont invalides. Veuillez réessayer."
    case unableToFavorite = "Une erreur est survenue lors de l’ajout de cet utilisateur aux favoris. Veuillez réessayer."
    case alreadyInFavorites = "Vous avez déjà ajouté cet utilisateur aux favoris. Vous devez VRAIMENT l’apprécier !"
}

enum GFAlertMessages {
    static let invalidUsername = "Veuillez entrer un nom d'utilisateur. Nous devons savoir qui vous cherchez 😀."
    static let addSucess = "Vous avez ajouté cet utilisateur aux favoris avec succès 🎉."
    static let invalidURL = "l'URL utilisée est invalide."
    static let noFollower = "Cet utilisateur n'a aucun followers. Quelle tristesse 🙂‍↕️"
}

let okString = "OK"
let padding:CGFloat = 20
let textImagePadding: CGFloat = 12
let itemHeight:CGFloat = 140
