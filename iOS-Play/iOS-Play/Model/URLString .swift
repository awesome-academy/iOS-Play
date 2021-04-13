//
//  URLString .swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation

let baseURL = "https://rss.itunes.apple.com/api/v1/us"

let appURL = "\(baseURL)/ios-apps"
let musicURL = "\(baseURL)/itunes-music"

let resultLimit = "20/explicit.json"

enum AppUrl {
    case newGame
    case newApp
    case topFree
    case freeIpad
    case topGrossing
    case grossingIpad
    case topPaid
    
    var url: String {
        switch self {
        case .newGame:
            return "\(appURL)/new-games-we-love/all/\(resultLimit)"
        case .newApp:
            return ""
        case .topFree:
            return "\(appURL)/top-free/all/\(resultLimit)"
        case .freeIpad:
            return ""
        case .topGrossing:
            return ""
        case .grossingIpad:
            return ""
        case .topPaid:
            return ""
        }
    }
}

//"Hot Track","New Release","Top Album","Top Song","Comming"]

enum MusicUrl {
    case hotTrack
    case newRelease
    case topAlbum
    case topSong
    case comming
    
    var url: String {
        switch self {
        case .hotTrack:
            return "\(musicURL)/hot-tracks/all/\(resultLimit)"
        case .newRelease:
            return ""
        case .topAlbum:
            return ""
        case .topSong:
            return ""
        case .comming:
            return ""
        }
    }
}
