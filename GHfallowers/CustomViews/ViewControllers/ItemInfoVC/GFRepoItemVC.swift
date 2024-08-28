//
//  GFRepoItemVC.swift
//  GHfallowers
//
//  Created by Fen on 28/08/2024.
//

import UIKit

class GFRepoItemVC : GFItemInfoViewVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
}
