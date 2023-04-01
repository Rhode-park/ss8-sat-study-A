//
//  Cache.swift
//  Cache
//
//  Created by Jinah Park on 2023/04/01.
//

import UIKit

class Cache {
    static let imageCache = NSCache<NSString, UIImage>()
    
    func startLoad(imageURL: String, completionHandler: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: imageURL) else { return }
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else {
                return
            }
            
            let mimeType = httpURLResponse.mimeType
            
            if mimeType?.lowercased().contains("image") != nil {
                DispatchQueue.main.async {
                    let image = UIImage(data: data!)
                    
                    Cache.imageCache.setObject(image!, forKey: url.absoluteString as NSString)
                    completionHandler(image)
                }
            }
        }.resume()
    }
}
