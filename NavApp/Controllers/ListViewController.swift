//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var venue = [Venues](){
        didSet {
            DispatchQueue.main.async {
                self.listView.myTableView.reloadData()
            }
        }
    }
    
    var listView = ListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listView)
        listView.myTableView.delegate = self
        listView.myTableView.dataSource = self
        
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
    }
    
    var venueInfo: Venue?
    
    
    
    private func getVenueDetails(venueId:String,date:String){
        VenueApiClient.getSpecificVenueInfo(venueId: venueId, date: date) { (error, venueInfo) in
            if let error = error {
                print(error.errorMessage())
            }
            if let venueInfo = venueInfo {
                self.venueInfo = venueInfo
                dump(venueInfo)
            }
        }
    }
}



//JOSHUA
extension ListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        //getVenuesInArea
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listView.myTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = ListDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
        print("Dont touch me")
       
        // getvenueDetails -> give you the venue ID
        // and you use itt to call getVenueDetails
    }
    
}
