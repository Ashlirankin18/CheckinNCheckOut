//
//  ImageDataModel.swift
//  NavApp
//
<<<<<<< HEAD
//  Created by Jeffrey Almonte on 2/21/19.
=======
//  Created by Ashli Rankin on 2/16/19.
>>>>>>> e97b5dd1c8742db6567b563858409a8c89fcd323
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct ImageDataModel:Codable{
<<<<<<< HEAD
    let response: PhotoData
}
struct PhotoData:Codable{
    let photos: PhotoContents
}
struct PhotoContents:Codable {
    let items: [Items]
}
struct Items:Codable{
    let prefix: String
    let suffix: String
=======
  let response: PhotoData
}
struct PhotoData:Codable{
  let photos: PhotoContents
}
struct PhotoContents:Codable {
  let items: [Items]
}
struct Items:Codable{
  let prefix: String
  let suffix: String
>>>>>>> e97b5dd1c8742db6567b563858409a8c89fcd323
}
