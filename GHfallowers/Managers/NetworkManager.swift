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
//    le type Result permet de se passer des optionnels, il permet de donner un type de retour en caise de .success ou de .failure
    func getFollowers(for username : String, page : Int, completed : @escaping (Result<[Follower],GFError>)->Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure (.invalidUsername))
            return
        }
//        gestion des erreurs de l'appel, si il y en a une, on revoit completed avec un [Follower] nil et un message d'erreur
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            erreur si il n'y a pas de connexion
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
//            erreur si la reponse du serveur n'est pas 200 (OK)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
//            erreur si la data est vide
            guard let  data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
//                on decode la reponse JSON en objet swift
                let decoder = JSONDecoder()
//                permet de transcrire le snake_case du json en camelCase pour swift
                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                on essaye de decoder la data en liste de Follower
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
