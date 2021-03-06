//
//  FeedTypeEnum.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation

enum FeedType {
    case apps
    case musics
    case movies
    case books
    case tvShows
    
    var item: [String] {
        switch self {
        case .apps:
            return ["New Game","New App","Top Free","Free Ipad","Top Grossing","Grossing Ipad","Top Ipad"]
        case .musics:
            return ["Hot Track","New Release","Top Album","Top Song","Comming"]
        case .movies:
            return ["Action & Adventure", "Hot Now", "Documentary"]
        case .books:
            return ["Top Free", "Top Paid"]
        case .tvShows:
            return ["Top TV Episodes", "Top TV Seasons"]
        }
    }
}
