//
//  MainViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//
import UIKit
import MapKit

class MainViewController: UIViewController {
    
    var venueString = ""
    var dateString = ""
    var latitude = ""
    var longitude = ""
     var catego = [CategoryInfo]()
    var venues = [VenuesInfo]() {
        didSet {
            DispatchQueue.main.async {
              self.makeAnnotations(venues: self.venues)
            }
        }
    }
    
  
   private var annoations = [MKAnnotation]()
    var mainView = MainView()
    var mapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
         mainView.keywordtextFied.delegate = self
        mainView.secondTextField.delegate = self
        
    
    }
    
  
    
  func makeAnnotations(venues:[VenuesInfo]) {
        mapView.mapView.removeAnnotations(annoations)
        annoations.removeAll()
        var ann = [MKAnnotation]()
        for vuenueToSet in venues {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = vuenueToSet.location.lat
            annotation.coordinate.longitude = vuenueToSet.location.lng
            annotation.title = vuenueToSet.name
            ann.append(annotation)
        }
        annoations = ann
        mapView.mapView.showAnnotations(annoations, animated: true)
    }
   

}


extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      var keyword = ""
      var placeName = ""
      
        guard let place = mainView.secondTextField.text,
        !place.isEmpty else { return false}
          placeName = place
      

        guard let placeKeyword = mainView.keywordtextFied.text else {return false}
          keyword = placeKeyword
      
  
      
      LocationService.getCoordinate(addressString: placeName) { (coordinates, error) in
        if let error = error{
          print(error.localizedDescription)
        }else {
          VenueApiClient.getVenues(keyword: keyword, lattitude: coordinates.latitude, longitude: coordinates.longitude, date: "20190222", completionHandler: { (error, venues) in
            if let error = error{
              print(error.errorMessage())
            }
            if let venues = venues{
              DispatchQueue.main.async {
                self.makeAnnotations(venues: venues)
                let mapViewController = MapViewController.init(annotations: self.annoations, venues: venues)
                let navigationController = UINavigationController(rootViewController: mapViewController)
                self.present(navigationController, animated: true, completion: nil)
                
              }
             
            }
          })
        }
      }
      
     
      return true
  }
}


