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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FavoritesViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = favView.collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoriteCell
    return cell
    }
    
    
}
