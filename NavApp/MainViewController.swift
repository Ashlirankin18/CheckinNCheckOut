//
//  MainViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    var mainView = MainView()
   override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.delegate = self 
        mainView.mapButton.addTarget(self, action: #selector(presentMapView), for: .touchUpInside)
       mainView.listButton.addTarget(self, action:#selector(presentListVC), for: .touchUpInside)
        gimeMeData()
    }
    @objc func presentMapView(){
    let mapViewController = MapViewController()
    let navController = UINavigationController(rootViewController: mapViewController)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    @objc func presentListVC() {
        let listVC = ListViewController()
        self.present(listVC, animated: true, completion: nil)
    }
    
    func gimeMeData() {
        
    }
    
}

extension MainViewController: MainViewDelegate {
    func showMapInDetailedView() {
       let mapVC = MapViewController()
        present(mapVC, animated: true)
    }
    
    
}


