//
//  VenueApiClient.swift
//  CheckinNCheckOut
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

final class VenueApiClient {
    
    
  // this func get all the venues in an area based on the users's location
  // the format for the date must be YYYY-MM-DD -> example 20190212
    static func getVenues(keyword: String, lattitude:Double,longitude:Double,date:String,completionHandler: @escaping(AppError?,[VenuesInfo]?) -> Void ){
    let urlString = "https://api.foursquare.com/v2/venues/search?ll=\(lattitude),\(longitude)&client_id=\(SecretKeys.clientId)&client_secret=\(SecretKeys.clientKey)&v=\(date)&query=\(keyword)"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error {
        completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
          let venues = try JSONDecoder().decode(Venues.self, from: data)
            let venueInfo = venues.response.venues
          completionHandler(nil,venueInfo)
        }catch{
          completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
  // this func needs the venue's Id and date the user is thinking to work. (receive data from the server)
  static func getVenueInformation(venueId:String,date:String,completionHandler: @escaping (AppError?,Venue?) -> Void){
  let urlString = "https://api.foursquare.com/v2/venues/\(venueId)?&client_id=\(SecretKeys.clientId)&client_secret=\(SecretKeys.clientKey)&v=\(date)"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error {
        completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
          let venueInfo = try JSONDecoder().decode(Venue.self, from: data)
          completionHandler(nil,venueInfo)
        }catch{
          completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }

    static func searchPlace(keyword: String, location: String,date:String,completionHandler: @escaping(AppError?,[VenuesInfo]?) -> Void ){
let thing = "https://api.foursquare.com/v2/venues/search?near=\(location.replacingOccurrences(of: " ", with: "_"))&client_id=\(SecretKeys.clientId)&client_secret=\(SecretKeys.clientKey)&v=\(date)"
      
        let urlString = "https://api.foursquare.com/v2/venues/search?near=\(location.replacingOccurrences(of: " ", with: "_"))&client_id=\(SecretKeys.clientId)&client_secret=\(SecretKeys.clientKey)&v=\(date)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
            if let error = error {
                completionHandler(AppError.badURL(error.errorMessage()),nil)
            }
            if let data = data {
                do{
                    let venues = try JSONDecoder().decode(Venues.self, from: data)
                    let venueInfo = venues.response.venues
                    completionHandler(nil,venueInfo)
                }catch{
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
        }
    }


  static func getVenueImageData(venueId:String,date:String, completionHandler: @escaping (AppError?,Items?) -> Void){
    let urlString = "https://api.foursquare.com/v2/venues/\(venueId)/photos?&client_id=\(SecretKeys.clientId)&client_secret=\(SecretKeys.clientKey)&v=\(date)"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error{
       completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data{
        do{
          let imageData = try JSONDecoder().decode(ImageDataModel.self, from: data)
          let images = imageData.response.photos.items.first
          completionHandler(nil,images)
        }catch{
          completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
}
