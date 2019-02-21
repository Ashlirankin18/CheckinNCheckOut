//
//  OneVenueModel.swift
//  NavApp
//

//  Created by Ashli Rankin on 2/21/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

struct VenueInformation:Codable{
  let response: Response
}
struct Response:Codable{
  let venue: Venue
}
struct Venue:Codable {
  let id:String
  let name:String
  let contact: ContactInfo
  let location: VenueLocation
  let categories: [CategoryInfo]
  let listed: IsListed
}
struct VenueLocation:Codable{
  let address:String
  let crossStreet:String
  let postalCode:String
  let city:String
  let lat:Double
  let lng:Double
}
struct IsListed:Codable {
  let groups: [TheGroups]
}
struct TheGroups:Codable{
  let items: [TheItems]
}
struct TheItems:Codable{
  let name:String
  let description:String
  let user:User
}
struct User:Codable{
  let firstName: String
  let photo: Items
}
