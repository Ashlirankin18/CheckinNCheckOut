//
//  VenueModel.swift
//  CheckinNCheckOut
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct Venues:Codable {
  let response:Result
}
struct Result:Codable {
  let venues: [VenuesInfo]
}
struct VenuesInfo:Codable {
  let id : String
  let name: String
  let contact: ContactInfo?
  let location:Location
  let categories: [CategoryInfo]
}
struct ContactInfo:Codable {
  let phone: String?
  let formattedPhone: String?
  let twitter:  String?
  let instagram: String?
  let facebook: String?
  let facebookUsername:String?
  let facebookName: String?
}
struct Location:Codable {
  let formattedAddress: [String]
}
struct CategoryInfo:Codable{
  let id:String
  let name:String
  let icon:IconInfo
}
struct Likes:Codable {
  let count: Int
  
}
struct IconInfo:Codable {
  let prefix:String
  let suffix:String
}
struct Listed:Codable {
  let groups: [Groups]
}
struct Groups:Codable {
  let type: String
  let items: [GroupInfo]
}
struct GroupInfo:Codable {
  let id: String
  let name: String
  let description:String
  let type:String
  
}
