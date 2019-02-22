//
//  FavoritesViewController.swift
//  NavApp
//
//  Created by Joshua Viera on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var favView = FavoritesView()
    var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favView)
        favView.collectionview.delegate = self
        favView.collectionview.dataSource = self
      self.navigationItem.title = "Collections"
    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.favView.collectionview.reloadData()
  }
}

extension FavoritesViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionPersistanceHelper.getUserInfo().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = favView.collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoriteCell
    return cell
    }
    
    
}
