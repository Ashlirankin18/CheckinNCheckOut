//
//  VenueApiClient.swift
//  CheckinNCheckOut
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

final class VenueApiClient {
  static func getVenues(date:String,completionHandler: @escaping(AppError?,[Result]?) -> Void ){
    let urlString = "https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=\(SecretKeys.clientId)&client_secret=\(SecretKeys.clientKey)&v=\(date)"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error {
        completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
          let venues = try JSONDecoder().decode(Venue.self, from: data).response
          completionHandler(nil,[venues])
        }catch{
          completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
}
