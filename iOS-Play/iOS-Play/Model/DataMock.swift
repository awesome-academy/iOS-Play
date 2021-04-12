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
        models.append(.genreTitle(model: GenreModel(smallLabel: "",
                                                    GenreLabel: "New Game")))
        return models
    }
    
    
    func getBanner() -> [CellModel] {
        var models = [CellModel]()
        
        models.append(.bannerView(model: HighlightTableCellModel(artistName: "SheepofG",
                                                              id: "",
                                                              releaseDate: "04.04.2020",
                                                              name: "Brawlhalla",
                                                              copyright: "© SheepofG LLC 2021 / ZZEDZZ7®",
                                                              artistUrl: "",
                                                              artworkUrl100: "",
                                                              image: Asset.braw.image,
                                                              highlightImage: Asset.banner5.image)))
        
        return models
    }
    
    func getHighlight() -> [CellModel] {
        var models = [CellModel]()
        
        models.append(.highlightView(model: [
            HighlightTableCellModel(artistName: "Riot",
                                    id: "",
                                    releaseDate: "02.01.2020",
                                    name: "Wild Rift",
                                    copyright: "© SheepofG LLC 2021 / ZZEDZZ7®",
                                    artistUrl: "",
                                    artworkUrl100: "",
                                    image: Asset.loll.image,
                                    highlightImage: Asset.loLbanner.image),
            
            HighlightTableCellModel(artistName: "HonKai Impact",
                                    id: "",
                                    releaseDate: "03.03.2020",
                                    name: "GhenShin Impact",
                                    copyright: "© SheepofG LLC 2021 / ZZEDZZ7®",
                                    artistUrl: "",
                                    artworkUrl100: "",
                                    image: Asset.ghenshin.image,
                                    highlightImage: Asset.banner1.image),
            
            HighlightTableCellModel(artistName: "Riot",
                                    id: "",
                                    releaseDate: "05.01.2017",
                                    name: "FiFa Online 4",
                                    copyright: "© SheepofG LLC 2021 / ZZEDZZ7®",
                                    artistUrl: "",
                                    artworkUrl100: "",
                                    image: Asset.fifa.image,
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
    
    func getOverView() -> [DetailCellModel] {
        var models = [DetailCellModel]()
        
        models.append(.overView(model: OverViewTableCellModel(artistName: "SheepofG",
                                                              id: "",
                                                              releaseDate: "05.01.99",
                                                              name: "Brawlhalla",
                                                              copyright: "© SheepofG LLC 2021 / ZZEDZZ7®",
                                                              artistUrl: "",
                                                              artworkUrl100: "")))
        
        return models
    }
    
    func getDescriptionView() -> [DetailCellModel] {
        var models = [DetailCellModel]()
        
        models.append(.descriptionView(model: [
            DescriptionCollectionCellModel(aboveString: "#1",
                                           belowString: "IMDb Top"),
            DescriptionCollectionCellModel(aboveString: "4.7★",
                                           belowString: "150K reviews"),
            DescriptionCollectionCellModel(aboveString: "710.15",
                                           belowString: "MB"),
            DescriptionCollectionCellModel(aboveString: "12+",
                                           belowString: "Rated for 12+"),
            DescriptionCollectionCellModel(aboveString: "1M+",
                                           belowString: "Download")
        ]))
        return models
    }
    
    
    func getDownloadView() -> [DetailCellModel]{
        var models = [DetailCellModel]()
        
        models.append(.downloadView(model: DownloadTableCellModel(appImage: Asset.banner1.image)))
        return models
    }
    
    func getCommmentView() -> [DetailCellModel]{
        var models = [DetailCellModel]()
        
        models.append(.commentView(model: [
            CommentCellModel(userImage: Asset.music0.image,
                             commentString: "Skyyyyy ơiiiiiiii \nGì ạ Gì ạaaaaa ^n "),
            CommentCellModel(userImage: Asset.music1.image,
                             commentString: "Đưa tay đây nào \nMãi bên nhau bạn nhớ"),
            CommentCellModel(userImage: Asset.music2.image,
                             commentString: "Bố em hút rất nhiều thuốc \nBố anh hút rất nhiều thuốc"),
            CommentCellModel(userImage: Asset.music0.image,
                             commentString: "Skyyyyy ơiiiiiiii \nGì ạ Gì ạaaaaa ^n "),
            CommentCellModel(userImage: Asset.music1.image,
                             commentString: "Đưa tay đây nào \nMãi bên nhau bạn nhớ"),
            CommentCellModel(userImage: Asset.music2.image,
                             commentString: "Bố em hút rất nhiều thuốc \nBố anh hút rất nhiều thuốc")
        ]))
        return models
    }
    
    func getFeedResults() -> [FeedResults] {
      
        let models = [FeedResults](repeating: FeedResults(artistName: "SheepofG", id: "", releaseDate: "01.03.2021", name: "Wild Rift", copyright: "", artistUrl: "", artworkUrl100: "", genres: []), count: 15)
        
        return models
    }
}
