//
//  URLString .swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation

let baseURL = "https://rss.itunes.apple.com/api/v1/us"

let appURL = "\(baseURL)/ios-apps"
let resultLimit = "20/explicit.json"

enum AppUrl {
    case newGame
    case newApp
    case topFree
    case freeIpad
    case topGrossing
    case grossingIpad
    case topPaid
    
    var url : String {
        switch self {
        case .newGame:
            return "\(appURL)/new-games-we-love/all/\(resultLimit)"
        case .newApp:
            return ""
        case .topFree:
            return ""
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
