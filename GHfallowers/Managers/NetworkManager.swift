//
//  NetworkManager.swift
//  GHfallowers
//
//  Created by Fen on 05/08/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    private init() {}
    
    func getFollowers(for username : String, page : Int, completed : @escaping ([Follower]?,String?)->Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil,"This username created an invalid request, Please Try agan.")
            return
        }
//        gestion des erreurs de l'appel, si il y en a une, on revoit completed avec un [Follower] nil et un message d'erreur
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            erreur si il n'y a pas de connexion
            if let _ = error {
                completed(nil,"Unable to complete your request. Please check your internet connection.")
                return
            }
//            erreur si la reponse du serveur n'est pas 200 (OK)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil,"Invalid response from the server. Please try again")
                return
            }
//            erreur si la data est vide
            guard let  data = data else {
                completed(nil, "The data received from the server was invalid. Please try agein.")
                return
            }
            
            do {
//                on decode la reponse JSON en objet swift
                let decoder = JSONDecoder()
//                permet de transcrire le snake_case du json en camelCase pour swift
                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                on essaye de decoder la data en liste de Follower
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            } catch {
                completed(nil,"The data received from the server was invalid. Please try agein.")
            }
        }
        task.resume()
    }
}
