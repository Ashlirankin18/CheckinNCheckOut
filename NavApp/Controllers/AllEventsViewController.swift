//
//  AllEventsViewController.swift
//  NavApp
//
//  Created by Olimpia on 2/19/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit


class AllEventsViewController: UIViewController {

    var allEvents = AllEventsView()
    
    var list = [VenuesInfo]()
//        didSet {
//            DispatchQueue.main.async {
//                self.allEvents.collectionView.reloadData()
//
//            }
//        }
//    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(allEvents)
        allEvents.collectionView.delegate = self
        allEvents.collectionView.dataSource = self
          self.allEvents.collectionView.register(AllListCell.self, forCellWithReuseIdentifier: "ListCell")
        let dismiss = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismmisAct))
      self.navigationItem.leftBarButtonItem = dismiss
        
    }
    
    init(list: [VenuesInfo]) {
        super.init(nibName: nil, bundle: nil)
        self.list = list
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func dismmisAct() {
        dismiss(animated: true, completion: nil)
    }


}

extension AllEventsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? AllListCell else { return UICollectionViewCell() }
        let venueToSet = list[indexPath.row]
        cell.textLabel.text! = venueToSet.name
       // cell.textView.text! = venueToSet.description!
        return cell
    }
    
    
}
    
    
    

