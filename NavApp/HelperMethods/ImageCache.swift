//
//  ImageCache.swift
//  NavApp
//
//  Created by Olimpia on 2/21/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

import UIKit

final class ImageCache {
    private init() {}
    
    static let shared = ImageCache()
    
    private static var cache = NSCache<NSString, UIImage>()
    
    public func fetchImageFromNetwork(urlString: String, completion: @escaping (AppError?, UIImage?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
            
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(error, nil)
                }
            } else if let data = data {
                DispatchQueue.global().async {
                    if let image = UIImage(data: data) {
                        ImageCache.cache.setObject(image, forKey: urlString as NSString)
                        DispatchQueue.main.async {
                            completion(nil, image)
                        }
                    }
                }
            }
        }
    }
    
    public func fetchImageFromCache(urlString: String) -> UIImage? {
        return ImageCache.cache.object(forKey: urlString as NSString)
    }
    
    
    
    
    
}


