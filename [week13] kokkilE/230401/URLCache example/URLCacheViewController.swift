//
//  ViewController.swift
//  230401
//
//  Created by kokkilE on 2023/04/01.
//

import UIKit

final class URLCacheViewController: UIViewController {
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBAction func touchUpFirstImageButton(_ sender: UIButton) {
        let urlString = "https://wallpaperaccess.com/download/europe-4k-1369012"
        guard let firstImageURL = URL(string: urlString) else { return }
        
        if let cachedImage = URLCacheManager.shared.cachedImage(from: firstImageURL) {
            print("[URLCache] 캐시된 데이터가 있습니다.")
            firstImage.image = cachedImage
            
            return
        }
        
        URLCacheNetworkManager.requestImage(from: firstImageURL) { data, response in
            print("[URLCache] 새로운 이미지를 받아왔습니다.")
            URLCacheManager.shared.setObject(response: response, data: data, to: firstImageURL)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.firstImage.image = image
            }
        }
    }
    
    @IBAction func touchUpSecondImageButton(_ sender: UIButton) {
        let urlString = "https://wallpaperaccess.com/download/europe-4k-1318341"
        guard let secondImageURL = URL(string: urlString) else { return }
        
        if let cachedImage = URLCacheManager.shared.cachedImage(from: secondImageURL) {
            print("[URLCache] 캐시된 데이터가 있습니다.")
            secondImage.image = cachedImage
            
            return
        }
        
        URLCacheNetworkManager.requestImage(from: secondImageURL) { data, response in
            print("[URLCache] 새로운 이미지를 받아왔습니다.")
            URLCacheManager.shared.setObject(response: response, data: data, to: secondImageURL)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.secondImage.image = image
            }
        }
    }
    
    @IBAction func touchUpClearImageButton(_ sender: UIButton) {
        print("[URLCache] 이미지를 초기화합니다.")
        firstImage.image = nil
        secondImage.image = nil
    }
    
    @IBAction func touchUpClearCacheButton(_ sender: UIButton) {
        print("[URLCache] 모든 캐시 데이터를 삭제했습니다.")
        URLCacheManager.shared.clearCache()
    }
}
