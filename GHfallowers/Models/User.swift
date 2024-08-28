//
//  User.swift
//  GHfallowers
//
//  Created by Fen on 05/08/2024.
//

import Foundation

struct User : Codable {
    let login : String
    let avatarUrl : String
    var name : String?
    var location : String?
    var bio : String?
    let publicRepos : Int
    let publicGists : Int
    let htmlUrl : String
    let followers : Int
    let following : Int
    let createdAt : String
}
