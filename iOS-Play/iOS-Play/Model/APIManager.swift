//
//  APIManager.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation

enum APIManagerError : Error {
    
    case badResponse(URLResponse?)
    case badData
    case badLocalUrl
}

fileprivate struct APIResponse: Codable {
    
    let feed: Feeds
}

final class APIManager {
    
    static var shared = APIManager()
    
    private var imagesCache = NSCache<NSString, NSData>()
    
    func getNewGame(urlString: String, completion: @escaping ([FeedResults]?,Error?) -> (Void)) {
        post(urlString: urlString, completion: completion)
    }
    
    func getImage(results: FeedResults, completion: @escaping (Data?, Error?) -> (Void)) {
        guard let url = URL(string: results.artworkUrl100) else { return }
        download(imageURL: url, completion: completion)
    }
    
    func getArtwork(urlString: String, completion: @escaping (Data?, Error?) -> (Void)) {
        guard let url = URL(string: urlString) else { return }
        download(imageURL: url, completion: completion)
    }
    
    func post(urlString: String, completion: @escaping ([FeedResults]?, Error?) -> (Void)) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil,error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, APIManagerError.badResponse(response))
                
                return
            }
            
            guard let data = data else {
                completion(nil, APIManagerError.badData)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(response.feed.results, nil)
            } catch let error{
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
    private func download(imageURL : URL, completion: @escaping (Data?, Error?) -> (Void)) {
        if let imageData = imagesCache.object(forKey: imageURL.absoluteString as NSString) {
            //print ("using cached images")
            completion(imageData as Data, nil)
            return
        }
        
        let task = URLSession.shared.downloadTask(with: imageURL) { [weak self] localUrl, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, APIManagerError.badResponse(response))
                return
            }
            
            guard let localUrl = localUrl else {
                completion(nil, APIManagerError.badLocalUrl)
                return
            }
            
            do {
                let data = try Data(contentsOf: localUrl)
                self?.imagesCache.setObject(data as NSData, forKey: imageURL.absoluteString as NSString)
                completion(data, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
