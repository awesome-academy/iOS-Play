//
//  Feed.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation

fileprivate struct APIResponse: Codable {
    
    let feed: Feeds
}

struct Feeds: Codable {
    let title: String
    let updated: String
    let results: [FeedResults]
}

struct FeedResults: Codable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let copyright: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let genres: [Genre]?
}

struct Genre: Codable {
    let genreId: String
    let name: String
    let url: String
}
