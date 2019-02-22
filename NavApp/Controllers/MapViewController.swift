//
//  MapViewController.swift
//  NavApp
//
//  Created by Olimpia on 2/13/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
  
    var annotationData = [VenuesInfo]()
    var annotations = [MKAnnotation]()
    var appMapView = MapView()
    var myMapView = MKMapView()
    var locationToPin = [Location]()
    let locationManager = CLLocationManager()
    let regionInMetters: Double = 10000
    var previousLocation: CLLocation?
  var urlStrings: [String]?
  var items : Items?
  var venueImage: UIImage?
    init(annotations: [MKAnnotation], venues: [VenuesInfo]) {
        super.init(nibName: nil, bundle: nil)
        self.annotations = annotations
        self.annotationData = venues
      
      
  }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " NAV APP "
        view.backgroundColor = .white
        view.addSubview(appMapView)
        checkLocationServices()
        butonsSetUp()
        appMapView.mapView.delegate = self 
        appMapView.mapView.showAnnotations(annotations, animated: true)
        annotationViewSetUp()

        dump(annotationData)
        tapRecogSetup()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap) )
       appMapView.annotationView.addGestureRecognizer(tap)
   
    }
    
    @objc func handleTap() {
       let detailedPinData = AnnotationDetailedViewController.init(vanues: annotationData)
        let navController = UINavigationController(rootViewController: detailedPinData)
        self.present(navController, animated: true, completion:  nil)
        
    }
    
    func tapRecogSetup() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap) )
        appMapView.annotationView.addGestureRecognizer(tap)
    }
    
    
    
    func annotationViewSetUp() {
        appMapView.annotationView.isHidden = true
        appMapView.addressVenue.isHidden = true
        appMapView.venueImage.isHidden = true
        appMapView.nameLabel.isHidden = true
        appMapView.buttonToMap.isHidden = true
    }
    
    func butonsSetUp() {
        let dismiss = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismmisAction))
        self.navigationItem.leftBarButtonItem = dismiss
        
        let toggle = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(toggleListMap))
        self.navigationItem.rightBarButtonItem = toggle
    }
    @objc func dismmisAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc func toggleListMap() {
      let listVC = ListViewController(venues: annotationData)
      let navigationController = UINavigationController(rootViewController: listVC)
      listVC.modalPresentationStyle = .currentContext
      listVC.modalTransitionStyle = .crossDissolve
        present(navigationController, animated: true)
    }
    
    
    
    func setUpLocationServices() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    
    func centerUserOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMetters, longitudinalMeters: regionInMetters)
            appMapView.mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationServices()
            checkLocationAuthorization()
        } else {
            //show alert to user
        }
    }
    
    func checkLocationAuthorization() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
            trakingUserLocation()
            case .denied:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                //show alert letting them know the tea
                break
            case .authorizedAlways:
                break
            }
        }
    
    func trakingUserLocation() {
        appMapView.mapView.showsUserLocation = true
        centerUserOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: appMapView.mapView)
    }
    
    func getCenterLocation(for myMapView: MKMapView) -> CLLocation {
        let latitud = myMapView.centerCoordinate.latitude
        let longitud = myMapView.centerCoordinate.longitude
        return CLLocation(latitude: latitud, longitude: longitud)
    }
  
  func getImagesFromPrefixandSuffix(urlString:String,imageView:UIImageView){
    if let image = ImageCache.shared.fetchImageFromCache(urlString: urlString){
      DispatchQueue.main.async {
        imageView.image = image
      }
    }else{
      ImageCache.shared.fetchImageFromNetwork(urlString: urlString) { (error, image) in
        if let error = error{
          print(error.errorMessage())
        }
        if let image = image {
          DispatchQueue.main.async {
            imageView.image = image
            self.venueImage = image
          }
        }
      }
    }
  }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        return renderer
    }
    
   
        
      
   
    
   
    
func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        
        
        geoCoder.reverseGeocodeLocation(center) { [weak self ](placemarks, error) in
            guard self != nil else { return }
            if let error = error {
                print(error)
                //TODO: Show alert informing user
                print(error)
                return
            }
            guard let placemarks = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
          _ = placemarks.subThoroughfare ?? ""
          _ = placemarks.thoroughfare ?? ""
           
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        
        appMapView.annotationView.isHidden = false
        appMapView.addressVenue.isHidden = false
        appMapView.venueImage.isHidden = false
        appMapView.nameLabel.isHidden = false

        appMapView.buttonToMap.isHidden = false
        appMapView.reviews.isHidden = false
        appMapView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        guard let annotation = view.annotation else { return }
        
        let index = annotationData.index{ $0.location.lat == annotation.coordinate.latitude && $0.location.lng == annotation.coordinate.longitude }
        

        if let venueIndex = index {
        let venue = annotationData[venueIndex]
            appMapView.nameLabel.text = venue.name
            appMapView.addressVenue.text = venue.location.formattedAddress.first!

        let index = annotationData.index{
            $0.location.lat == annotation.coordinate.latitude && $0.location.lng == annotation.coordinate.longitude
        }
        if let venueIndex = index {
        let venue = annotationData[venueIndex]
        let venueId = venue.id
       
    VenueApiClient.getItemsPrefixAndSuffix(venueId: venueId, date: "20190220"){ (error, items) in
            if let error = error {
              print(error.errorMessage())
            }
            if let items = items{
              self.items = items
              let urlString = items.prefix + "300x500" + items.suffix
              self.getImagesFromPrefixandSuffix(urlString: urlString, imageView: self.appMapView.venueImage)
              DispatchQueue.main.async {
                self.appMapView.nameLabel.text = venue.name
                self.appMapView.addressVenue.text = venue.location.formattedAddress.first
              }
            }
          }
        } else {
            print("no index")
        }
        
        appMapView.mapView.deselectAnnotation(annotation, animated: true )
        
    
    
//        set up an action sheet to go to detalVC or the directions
        guard let userLocation = locationManager.location?.coordinate,
            let destination = view.annotation?.coordinate else {
                guard let venueLat = self.annotationData.first?.location.lat,
                    let venueLong = self.annotationData.first?.location.lng else {return}
                let coordinate = CLLocationCoordinate2DMake(venueLat,venueLong)
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
                mapItem.name = "Target location"
                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
                return
        }
        getDirections(from: userLocation, destination: destination)

    }

    private func getDirections(from: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        let request = createDirectionsRequest(fromCoordinate: from, toDestination: destination)
        let directions = MKDirections(request: request)
        resetMapView(newDirections: directions)

        directions.calculate { [unowned self] (response, error) in
            if let error = error {
                print("Can't get directions: \(error)")
                self.showAlert(title: "Can't get Directions", message: "\(error)" )
            } else if let response = response {
                for route in response.routes {
                    //                    // extra TODO: show directions word
                    var stepsStr = ""
                    let steps = route.steps
                    steps.forEach { stepsStr += "\($0.instructions)\n" }
                    self.appMapView.mapView.addOverlay(route.polyline)
                    self.appMapView.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    self.showAlert(title: "Directions", message: stepsStr)
                    break
                }
            }
        }
    }

    private func createDirectionsRequest(fromCoordinate: CLLocationCoordinate2D, toDestination: CLLocationCoordinate2D) -> MKDirections.Request {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: fromCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: toDestination))
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        return request
    }

    private func resetMapView(newDirections: MKDirections) {
        var directions = [MKDirections]()
        appMapView.mapView.removeOverlays(appMapView.mapView.overlays)
        directions.append(newDirections)
        let _ = directions.map { $0.cancel() }
    }

}





