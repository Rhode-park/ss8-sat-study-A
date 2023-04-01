//
//  NetworkManager.swift
//  230401
//
//  Created by kokkilE on 2023/04/01.
//

import UIKit

final class NetworkManager {
    static func requestImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            if let data = data {
                guard let image = UIImage(data: data) else {
                    print()
                    return
                }
                
                completion(.success(image))
            }
        }
        
        task.resume()
    }
}
