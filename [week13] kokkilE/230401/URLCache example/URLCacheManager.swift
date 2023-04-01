//
//  URLCacheManager.swift
//  230401
//
//  Created by kokkilE on 2023/04/01.
//

import UIKit

final class URLCacheManager {
    static let shared = URLCacheManager()
    
    private init() {}
    
    private let storage = URLCache.shared

    func cachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        
        if let cachedResponse = storage.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    func setObject(response: URLResponse, data: Data, to url: URL) {
        let urlRequest = URLRequest(url: url)
        
        let cachedResponse = CachedURLResponse(response: response, data: data, storagePolicy: .allowed)
        
        storage.storeCachedResponse(cachedResponse, for: urlRequest)
    }
    
    func clearCache() {
        storage.removeAllCachedResponses()
    }
}
