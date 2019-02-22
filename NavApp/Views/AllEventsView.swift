//
//  AllEventsView.swift
//  NavApp
//
//  Created by Olimpia on 2/19/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class AllEventsView: UIView {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 275)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let cv = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(collectionView)
        collectionView.register(AllListCell.self, forCellWithReuseIdentifier: "ListCell")
        backgroundColor = .blue
        
    }
    
    func setConstains() {
       collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22), collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)].forEach{ $0.isActive = true }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
