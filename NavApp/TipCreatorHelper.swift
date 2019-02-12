//
//  TipCreatorHelper.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
final class PersistanceHelper {
  private static let filename = "TipCreated.plist"
  private static var tips = [CreateTipModel]()
  
  static func getUserInfo() ->[CreateTipModel]{
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do{
          tips = try PropertyListDecoder().decode([CreateTipModel].self, from: data)
        }catch{
          print("no entries found")
        }
      }
    }else{
      print("\(filename) does not exist")
    }
    return tips
  }
  static func addItemsToDirectory(tip:CreateTipModel){
    tips.append(tip)
    saveItemToDirectory()
  }
  
  static func saveItemToDirectory(){
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    do{
      let data = try PropertyListEncoder().encode(tips)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch{
      print("propertyList encoding error")
    }
  }
  static func deleteItemsFromDirectory(newBook:CreateTipModel,index:Int){
    tips.remove(at: index)
    saveItemToDirectory()
  }
  static func updatesTheDirectory(item:CreateTipModel,index:Int){
    tips.insert(item, at: index)
    saveItemToDirectory()
  }
}
