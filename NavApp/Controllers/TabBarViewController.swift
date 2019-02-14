//
//  TabBarViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let listVC = ListViewController()
        let navController = UINavigationController(rootViewController: listVC)
        let mainVC = MainViewController()
        let favVc = FavoritesViewController()
        listVC.tabBarItem.title = "ListView"
        listVC.tabBarItem.image = #imageLiteral(resourceName: "icons8-news-feed-25")
        mainVC.tabBarItem.title = "Main"
        mainVC.tabBarItem.image = #imageLiteral(resourceName: "icons8-active-state-25")
        favVc.tabBarItem.title = "Favorites"
        favVc.tabBarItem.image = #imageLiteral(resourceName: "icons8-star-25")
        self.viewControllers = [navController,mainVC,favVc]
    }
    
    
}
