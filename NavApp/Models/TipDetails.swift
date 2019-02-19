//
//  CreateTipModel.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct CreateTipModel:Codable {
    let tips :[TipDetails]
}
struct TipDetails:Codable{
    let venueName: String
    let venueDescription:String
    let id: String
    let createdAt: String
}
