////
////  ViewController.swift
////  230401
////
////  Created by kokkilE on 2023/04/01.
////
//
//import UIKit
//
//final class ViewController: UIViewController {
//    @IBOutlet weak var firstImage: UIImageView!
//    @IBOutlet weak var secondImage: UIImageView!
//
//    @IBAction func touchUpFirstImageButton(_ sender: UIButton) {
//        let urlString = "https://wallpaperaccess.com/download/europe-4k-1369012"
//        guard let firstImageURL = URL(string: urlString) else { return }
//
//        if let cachedImage = NSCacheManager.shared.cachedImage(from: urlString) {
//            print("캐시된 데이터가 있습니다.")
//            firstImage.image = cachedImage
//
//            return
//        }
//
//        NetworkManager.requestImage(from: firstImageURL) { [weak self] in
//            switch $0 {
//            case .failure(let error):
//                print(error)
//            case .success(let result):
//                print("새로운 이미지를 받아왔습니다.")
//                NSCacheManager.shared.setObject(image: result, urlString: urlString)
//
//                DispatchQueue.main.async {
//                    self?.firstImage.image = result
//                }
//            }
//        }
//    }
//
//    @IBAction func touchUpSecondImageButton(_ sender: UIButton) {
//        let urlString = "https://wallpaperaccess.com/download/europe-4k-1318341"
//        guard let secondImageURL = URL(string: urlString) else { return }
//
//        if let cachedImage = NSCacheManager.shared.cachedImage(from: urlString) {
//            print("캐시된 데이터가 있습니다.")
//            secondImage.image = cachedImage
//
//            return
//        }
//
//        NetworkManager.requestImage(from: secondImageURL) { [weak self] in
//            switch $0 {
//            case .failure(let error):
//                print(error)
//            case .success(let result):
//                print("새로운 이미지를 받아왔습니다.")
//                NSCacheManager.shared.setObject(image: result, urlString: urlString)
//
//                DispatchQueue.main.async {
//                    self?.secondImage.image = result
//                }
//            }
//        }
//    }
//
//    @IBAction func touchUpClearImageButton(_ sender: UIButton) {
//        print("이미지를 초기화합니다.")
//        firstImage.image = nil
//        secondImage.image = nil
//    }
//
//    @IBAction func touchUpClearCacheButton(_ sender: UIButton) {
//        print("모든 캐시 데이터를 삭제했습니다.")
//        NSCacheManager.shared.clearCache()
//    }
//}
////
