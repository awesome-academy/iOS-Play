//
//  DataTest.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation
import UIKit

final class DataMock {
    
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
    
    func getGenre(smallText: String, genre: String) -> [MusicCellMode] {
        var models = [MusicCellMode]()
        models.append(.genreTitle(model: GenreModel(smallLabel: smallText, GenreLabel: genre)))
        return models
    }
    
    func getMusicCollecion() -> [MusicCellMode] {
        var models = [MusicCellMode]()
        models.append(.collectionView(model: [
            FeedResults(artistName: "Sơn Tùng MTP", id: "", releaseDate: "01.01.2021", name: "Chúng ta của hiện tại", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Đen", id: "", releaseDate: "01.01.2021", name: "Triệu lời cảm ơn", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Amee", id: "", releaseDate: "01.01.2021", name: "Tình bạn diệu kỳ", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Sơn Tùng MTP", id: "", releaseDate: "01.01.2021", name: "Chúng ta của hiện tại", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Đen", id: "", releaseDate: "01.01.2021", name: "Triệu lời cảm ơn", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Amee", id: "", releaseDate: "01.01.2021", name: "Tình bạn diệu kỳ", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Sơn Tùng MTP", id: "", releaseDate: "01.01.2021", name: "Chúng ta của hiện tại", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Đen", id: "", releaseDate: "01.01.2021", name: "Triệu lời cảm ơn", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Amee", id: "", releaseDate: "01.01.2021", name: "Tình bạn diệu kỳ", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Sơn Tùng MTP", id: "", releaseDate: "01.01.2021", name: "Chúng ta của hiện tại", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Đen", id: "", releaseDate: "01.01.2021", name: "Triệu lời cảm ơn", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
            FeedResults(artistName: "Amee", id: "", releaseDate: "01.01.2021", name: "Tình bạn diệu kỳ", copyright: "", artistUrl: "", artworkUrl100: "", genres: []),
        ]))
        
        return models
    }
    
    func getMusicFeature() -> [MusicCellMode] {
        var models = [MusicCellMode]()
        
        models.append(.featureView(mode: [
            Features(feature: "Free 3 months"),
            Features(feature: "7 milion songs"),
            Features(feature: "See the lyrics"),
            Features(feature: "Cancel any time")
        ]))
        return models
    }
    
    func getMusicBaner() -> [MusicCellMode] {
        var models = [MusicCellMode]()
        
        models.append(.bannerView(model: HighlightTableCellModel(artistName: "GDucky", id: "", releaseDate: "01.01.2021", name: "Breakfast", copyright: "", artistUrl: "", artworkUrl100: "", image: Asset.music3.image, highlightImage: Asset.musicbanner.image)))
        return models
    }
    
    func getImageBackground(image: UIImage?) -> [MovieDetailCellModel] {
        let models: [MovieDetailCellModel] = [.imageBackground(model: ImageBackgourndCellModel(image: image ?? Asset.marvel.image))]
        return models
    }
    
    func getOverView() -> [MovieDetailCellModel] {
        let models: [MovieDetailCellModel] = [.overView(model: OverViewTableCellModel(artistName: "SheepofG", id: "", releaseDate: "01.01.2021", name: "Godzilla", copyright: "© SheepofG LLC 2021 / ZZEDZZ7®", artistUrl: "", artworkUrl100: ""))]
        return models
    }
    
    func getCommmentView() -> [MovieDetailCellModel] {
        var models = [MovieDetailCellModel]()
        
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
    
    func getDescriptionView() -> [MovieDetailCellModel] {
        var models = [MovieDetailCellModel]()
        
        models.append(.descriptionView(model: [
            DescriptionCollectionCellModel(aboveString: "#1",
                                           belowString: "IMDb Top"),
            DescriptionCollectionCellModel(aboveString: "4.7★",
                                           belowString: "150K reviews"),
            DescriptionCollectionCellModel(aboveString: "12GB",
                                           belowString: "Duration"),
            DescriptionCollectionCellModel(aboveString: "12+",
                                           belowString: "Rated for 12+"),
            DescriptionCollectionCellModel(aboveString: "1M+",
                                           belowString: "Buy")
        ]))
        return models
    }
    
    func getInfoView() -> [MovieDetailCellModel] {
        let models : [MovieDetailCellModel] = [.infoView(model: InfoCellModel(infomation: "", firstKind: "Bonero", secondKind: "Gold Music"))]
        return models
    }
    
    func getBookCollection() -> [BookCellModel] {
        let models : [BookCellModel] = [.collectionView(model: [FeedResults](repeating: FeedResults(artistName: "SheepofG", id: "", releaseDate: "01.01.2021", name: "Conan", copyright: "copyright", artistUrl: "", artworkUrl100: "", genres: []), count: 10))]
        return models
    }
    
    func getGenre(smallText: String, genre: String) -> [BookCellModel] {
        var models = [BookCellModel]()
        models.append(.genreTitle(model: GenreModel(smallLabel: smallText, GenreLabel: genre)))
        return models
    }
    
    func getDescriptionView() -> [TVDetailCellModel] {
        var models = [TVDetailCellModel]()
        
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
    
    func getCommmentView() -> [TVDetailCellModel] {
        var models = [TVDetailCellModel]()
        
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

}
