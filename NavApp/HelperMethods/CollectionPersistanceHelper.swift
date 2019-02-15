//
//  CollectionPersistanceHelper.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
final class CollectionPersistanceHelper{
  private static let filename = "FavoritesCollection.plist"
  private static var collections = [FavoriteVenueCollection]()
  
  static func getUserInfo() ->[FavoriteVenueCollection]{
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do{
          collections = try PropertyListDecoder().decode([FavoriteVenueCollection].self, from: data)
        }catch{
          print("no entries found")
        }
      }
    }else{
      print("\(filename) does not exist")
    }
    return collections
  }
  static func addItemsToDirectory(collection:FavoriteVenueCollection){
    collections.append(collection)
    saveItemToDirectory()
  }
  
  static func saveItemToDirectory(){
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    do{
      let data = try PropertyListEncoder().encode(collections)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch{
      print("propertyList encoding error")
    }
  }
  static func deleteItemsFromDirectory(collection:FavoriteVenueCollection,index:Int){
   collections.remove(at: index)
    saveItemToDirectory()
  }
  static func updatesTheDirectory(item:FavoriteVenueCollection,index:Int){
    collections.insert(item, at: index)
    saveItemToDirectory()
  }
}
