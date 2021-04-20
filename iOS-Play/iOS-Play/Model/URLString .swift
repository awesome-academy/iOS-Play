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
let movieURL = "\(baseURL)/movies"
let bookURL = "\(baseURL)/books"
let tvShowURL = "\(baseURL)/tv-shows"

let resultLimit = "all/20/explicit.json"

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
            return "\(appURL)/new-games-we-love/\(resultLimit)"
        case .newApp:
            return "\(appURL)/new-apps-we-love/\(resultLimit)"
        case .topFree:
            return "\(appURL)/top-free/\(resultLimit)"
        case .freeIpad:
            return "\(appURL)/top-free-ipad/\(resultLimit)"
        case .topGrossing:
            return "\(appURL)/top-grossing/\(resultLimit)"
        case .grossingIpad:
            return "\(appURL)/top-grossing-ipad/\(resultLimit)"
        case .topPaid:
            return "\(appURL)/top-paid/\(resultLimit)"
        }
    }
}

enum MusicUrl {
    case hotTrack
    case newRelease
    case topAlbum
    case topSong
    case comming
    
    var url: String {
        switch self {
        case .hotTrack:
            return "\(musicURL)/hot-tracks/\(resultLimit)"
        case .newRelease:
            return "\(musicURL)/new-music/\(resultLimit)"
        case .topAlbum:
            return "\(musicURL)/recent-releases/\(resultLimit)"
        case .topSong:
            return "\(musicURL)/top-albums/\(resultLimit)"
        case .comming:
            return "\(musicURL)/top-songs/\(resultLimit)"
        }
    }
}

enum MovieUrl {
    case action
    case documentary
    case all
    
    var url: String {
        switch self {
        case .action:
            return "\(movieURL)/top-movies/\(resultLimit)"
        case .all:
            return "\(movieURL)/top-movies/documentary/\(resultLimit)"
        case .documentary:
            return "\(movieURL)/top-movies/action-and-adventure/\(resultLimit)"
        }
    }
}

enum BookUrl {
    case topFree
    case topPaid
    
    var url: String {
        switch self {
        case . topFree:
            return "\(bookURL)/top-free/all/30/explicit.json"
        case .topPaid:
            return "\(bookURL)/top-paid/all/15/explicit.json"
        }
    }
}

enum TVShowUrl {
    case topEpisodes
    case topSeason
    
    var url: String {
        switch self {
        case . topEpisodes:
            return "\(tvShowURL)/top-tv-episodes/\(resultLimit)"
        case .topSeason:
            return "\(tvShowURL)/top-tv-seasons/\(resultLimit)"
        }
    }
}
