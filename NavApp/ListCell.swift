//
//  ListCell.swift
//  NavApp
//
//  Created by Olimpia on 2/14/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit
import Foundation

class ListCell: UITableViewCell {

    lazy var testLabel: UILabel = {
        let testLabel = UILabel()
        testLabel.textColor = .black
        return testLabel
    }()
    
    override init(style: UITableViewCell.CellStyle,
         reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ListCell")
        addSubview(testLabel)
        constrains()
    }
    
    func constrains() {
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
