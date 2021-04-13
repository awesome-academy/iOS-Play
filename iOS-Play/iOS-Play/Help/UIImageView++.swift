//
//  UIImageView++.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/12/21.
//

import Foundation
import UIKit

private var imagesCache = NSCache<NSString, NSData>()

extension UIImageView {
    
    func setImage(urlString: String) {
        guard let imageUrl = URL(string: urlString) else {
            return
        }
        
        if let imageData = imagesCache.object(forKey: imageUrl.absoluteString as NSString) {
            self.image = UIImage(data: imageData as Data)
            return
        }
        
        let task = URLSession.shared.downloadTask(with: imageUrl) { [weak self] localUrl, response, error in
            if error != nil {
                self?.image = Asset.ios.image
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self?.image = Asset.ios.image
                return
            }
            
            guard let localUrl = localUrl else {
                self?.image = Asset.ios.image
                return
            }
            
            do {
                let data = try Data(contentsOf: localUrl)
                imagesCache.setObject(data as NSData, forKey: imageUrl.absoluteString as NSString)
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            } catch let error {
                print (error)
            }
        }
        
        task.resume()
    }
}
