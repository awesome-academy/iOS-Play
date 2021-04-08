//
//  DataTest.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation
import UIKit

class DataMock {
    
    static var shared = DataMock()
    
    func getNewGameGenre() -> [CellModel] {
        var models = [CellModel]()
        models.append(.genreTitle(model: GenreModel(smallLabel: "", GenreLabel: "New Game")))
        return models
    }
    
    
    func getBanner() -> [CellModel] {
        var models = [CellModel]()
        
        models.append(.bannerView(model: BannerTableCellModel(title: "LMAO",
                                                            bannerImage: Asset.banner5.image,
                                                            appName: "Brawlhalla",
                                                            authorName: "SheepofG",
                                                            release: "01.04.2020")
        ))
        
        return models
    }
    
    func getHighlight() -> [CellModel] {
        var models = [CellModel]()
        
        models.append(.highlightView(model: [
            HighlightTableCellModel(title: "LOL",
                                    image: Asset.loll.image,
                                    appName: "Wild Rift",
                                    authorName: "SheepofG",
                                    release: "05.01.99",
                                    highlightImage: Asset.loLbanner.image),
            HighlightTableCellModel(title: "LOL",
                                    image: Asset.ghenshin.image,
                                    appName: "GhenShon Impact",
                                    authorName: "SheepofG",
                                    release: "05.01.99",
                                    highlightImage: Asset.banner1.image),
            HighlightTableCellModel(title: "LOL",
                                    image: Asset.fifa.image,
                                    appName: "Fifa Online 4",
                                    authorName: "SheepofG",
                                    release: "05.01.99",
                                    highlightImage: Asset.banner2.image)
        ]))
        
        return models
    }
    
    func getList() -> [CellModel] {
        var models = [CellModel]()
        
        models.append(.listView(model: [
            ListTableCellModel(title: "Phiêu lưu"),
            ListTableCellModel(title: "Nhập vai"),
            ListTableCellModel(title: "Bắn súng"),
            ListTableCellModel(title: "Đá bóng"),
            ListTableCellModel(title: "Xếp hình"),
            ListTableCellModel(title: "Đố chữ"),
            ListTableCellModel(title: "Đua xe"),
            ListTableCellModel(title: "Mô phỏng"),
            ListTableCellModel(title: "Nhạc"),
            ListTableCellModel(title: "Sòng bạc")
        ]))
        
        return models
    }
}
