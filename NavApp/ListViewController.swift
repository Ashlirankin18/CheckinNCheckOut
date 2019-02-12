//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    //JOSHUA
    lazy var myTableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    var venue = [Result](){
        didSet {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
    
    var listView = ListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Joshua
        self.view.addSubview(myTableView)
        myTableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        setConstraints()
        
        
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        getVenuesInArea(date: "20190209")
    }
    
    //JOSHUA
    private func setConstraints() {
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func getVenuesInArea(date:String){
        VenueApiClient.getVenues(date: date) { (error, venue) in
            if let error = error {
                print(error.errorMessage())
            }
            if let venue = venue{
                self.venue = venue
                dump(venue)
                print("I have\(venue.count) items")
            }
        }
    }
    
    
}


//JOSHUA
extension ListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venue.count
        //getVenuesInArea
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        cell.venueTitle.text = venue[indexPath.row].venues[0].name
//        cell.favoriteButton.imageView?.image = UIImage(named: "icons8-star-25")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //TODO
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FavoritesViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Dont touch me")
       
        // getvenueDetails -> give you the venue ID
        // and you use itt to call getVenueDetails
    }
    
}
