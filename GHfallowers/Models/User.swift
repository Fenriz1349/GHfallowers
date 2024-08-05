//
//  User.swift
//  GHfallowers
//
//  Created by Fen on 05/08/2024.
//

import Foundation

struct User : Codable {
    var login : String
    var avatarUrl : String
    var name : String?
    var location : String?
    var bio : String?
    var publicRepos : Int
    var publicGists : Int
    var htmlUrl : String
    var followers : Int
    var following : Int
    var createdAt : String
}
