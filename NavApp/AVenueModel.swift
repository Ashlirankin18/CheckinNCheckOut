//
//  AVenueModel.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct AVenue:Codable {
  let response:AResult
}
struct AResult:Codable {
  let venue: AVenueInfo
}
struct AVenueInfo:Codable {
  let id : String?
  let name: String?
  let contact: ContactInfo?
  let location:Location?
  let categories: [CategoryInfo]
  let likes: Likes?
  let rating:Double?
  let description:String?
  let listed: Listed?
  
}
struct AContactInfo:Codable {
  let phone: String
  let formattedPhone: String
  let twitter:  String
  let instagram: String?
  let facebook: String
  let facebookUsername:String
  let facebookName: String
}
struct ALocation:Codable {
  let formattedAddress: [String]
}
struct ACategoryInfo:Codable{
  let id:String
  let name:String
  let icon:IconInfo
}
struct ALikes:Codable {
  let count: Int
  
}
struct AIconInfo:Codable {
  let prefix:String
  let suffix:String
}
struct AListed:Codable {
  let groups: [Groups]
}
struct AGroups:Codable {
  let type: String
  let items: [GroupInfo]
}
struct AGroupInfo:Codable {
  let id: String
  let name: String
  let description:String
  let type:String
  
}
