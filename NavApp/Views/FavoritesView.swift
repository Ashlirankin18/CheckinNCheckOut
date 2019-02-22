//
//  FavoritesView.swift
//  NavApp
//
//  Created by Joshua Viera on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    
    lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
        layout.itemSize = CGSize(width: 300, height: 400)
        var cv = UICollectionView(frame:  self.bounds, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    var cellId = "Cell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    
    private func commonInit() {
        setConstraints()
        collectionview.register(FavoriteCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}


extension FavoritesView  {
    private func setConstraints(){
        addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
