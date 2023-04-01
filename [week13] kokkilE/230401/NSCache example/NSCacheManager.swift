//
//  NSCacheManager.swift
//  230401
//
//  Created by kokkilE on 2023/04/01.
//

import UIKit

final class NSCacheManager {
    static let shared = NSCacheManager()
    
    private init() {}
    
    private let storage = NSCache<NSString, UIImage>()
    
    func cachedImage(from urlString: String) -> UIImage? {
        let cachedKey = NSString(string: urlString)
        
        if let cachedImage = storage.object(forKey: cachedKey) {
            return cachedImage
        }
        
        return nil
    }
    
    func setObject(image: UIImage, urlString: String) {
        let forKey = NSString(string: urlString)
        self.storage.setObject(image, forKey: forKey)
    }
    
    func clearCache() {
        storage.removeAllObjects()
    }
}
