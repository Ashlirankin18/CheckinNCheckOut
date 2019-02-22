//
//  CathegoryViewController.swift
//  NavApp
//
//  Created by Olimpia on 2/20/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class CathegoryViewController: UIViewController {

    var categoryView = CategoryView()
    var category = [CategoryInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(categoryView)
        categoryView.categoryTableView.delegate = self
        categoryView.categoryTableView.dataSource = self
        categoryView.categoryTableView.register(CategoryCell.self, forCellReuseIdentifier: "CategoryView")
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(dismissButton))
        self.navigationItem.leftBarButtonItem  = backButton
       
    }
    
    @objc func dismissButton() {
     dismiss(animated: true, completion: nil)
    }
    

    
    init(category: [CategoryInfo]) {
        super.init(nibName: nil, bundle: nil)
        self.category = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension CathegoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoryView.categoryTableView.dequeueReusableCell(withIdentifier: "CategoryView", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        let categoryToSet = category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
