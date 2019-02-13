//
//  DataPersistanceManager.swift
//  CheckinNCheckOut
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
  private init() {}
  
  static func documentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
  
  static func filepathToDocumentsDiretory(filename: String) -> URL {
    return documentsDirectory().appendingPathComponent(filename)
  }
}
