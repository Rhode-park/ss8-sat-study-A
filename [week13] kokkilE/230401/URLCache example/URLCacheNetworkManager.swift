//
//  URLCacheNetworkManager.swift
//  230401
//
//  Created by kokkilE on 2023/04/01.
//

import UIKit

final class URLCacheNetworkManager {
    static func requestImage(from url: URL, completion: @escaping (Data, URLResponse) -> Void) {
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            if let data = data,
               let response = response {
                completion(data, response)
            }
        }
        task.resume()
    }
}

