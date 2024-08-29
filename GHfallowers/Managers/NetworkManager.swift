//
//  NetworkManager.swift
//  GHfallowers
//
//  Created by Fen on 05/08/2024.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
//    NS vient de la transition avec Objective-C et veut dire Next Step
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
//    le type Result permet de se passer des optionnels, il permet de donner un type de retour en case de .success ou de .failure
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
//                decoder.dateDecodingStrategy = .iso8601
//                on essaye de decoder la data en liste de Follower
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getUserInfo(for username : String, completed : @escaping (Result<User,GFError>)->Void) {
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure (.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let  data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        //        si l'image est dans le cache, on l'utilise au lieu de la retelecharger
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        //        on ne fera pas de gestion d'erreur car on a placeholder pour l'image, et c'est plus rapide et fluide pour l'utilisateur
        guard let  url = URL (string: urlString) else {
            completed(nil)
            return}
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self, 
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                completed(nil)
                return
            }

            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
}
