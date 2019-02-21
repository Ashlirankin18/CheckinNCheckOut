//
//  ImageDataModel.swift
//  NavApp
//
//  Created by Jeffrey Almonte on 2/21/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct ImageDataModel:Codable{
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
}
