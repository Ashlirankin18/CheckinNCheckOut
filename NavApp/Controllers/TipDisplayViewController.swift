//
//  TipDisplayViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class TipDisplayViewController: UIViewController {

  let tipDisplayView = TipDisplayView()
   var cellId = "Cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tipDisplayView)
    tipDisplayView.collectionview.delegate = self
     tipDisplayView.collectionview.dataSource = self
    self.navigationItem.title = "Collections"
    self.tabBarController?.selectedViewController = self.tabBarController?.viewControllers?[2]
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.tipDisplayView.collectionview.reloadData()
  }
}

extension TipDisplayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return PersistanceHelper.getUserInfo().count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = tipDisplayView.collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoriteCell
    let venue = PersistanceHelper.getUserInfo()[indexPath.row]
    cell.nameLabel.text = venue.venueName
    cell.descriptionLabel.text = venue.venueDescription
    return cell
  }
  
  
}

    


