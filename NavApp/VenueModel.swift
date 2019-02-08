//
//  VenueModel.swift
//  CheckinNCheckOut
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct Venue:Codable {
  let result:Result
  
}
struct Result:Codable {
  let venue: VenueInfo
}
struct VenueInfo:Codable {
  let id : String
  let name: String
  let contact: ContactInfo
  let location:Location
  let categories: [CategoryInfo]
  let likes: Likes
  let rating:Double
  let description:String
  
}
struct ContactInfo:Codable {
  let phone: String
  let formattedPhone: String
  let twitter:  String
  let instagram: String
  let facebook: String
  let facebookUsername:String
  let facebookName: String
}
struct Location:Codable {
  let formattedAddress: String
}
struct CategoryInfo:Codable{
  let name:String
}
struct Likes:Codable {
  let count: Int
  
}
