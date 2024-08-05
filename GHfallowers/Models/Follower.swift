//
//  Follower.swift
//  GHfallowers
//
//  Created by Fen on 05/08/2024.
//

import Foundation

struct Follower : Codable {
//    pour utiliser codable il faut que le nom des paramètres correspondent exactement à ceux du json
//    mais il existe une methode pour convertir de snake_case à camelCase
//    ici on sait qu'il y a toujours un login et un avatar par defaut, sinon il faut privilégier les optionnels pour eviter les crashs
    var login : String
    var avatarUrl : String
}
