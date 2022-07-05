//
//  Route.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 27.05.2022.
//

import Foundation

enum Route {

    //https://api.genderize.io?name=peter
    //https://yummie.glitch.me
    //https://www.googleapis.com/youtube/v3
    // /dishes/cat1
//    static var Api_Key = "AIzaSyCEV_xXTXG7-aP9hY5R1a3R-BVT6M5IXYI"
//    static var baseUrl = "https://www.googleapis.com/youtube/v3"
//    static var PLAYLIST_ID = "PLN1mxegxWPd3d8jItTyrAxwm-iq-KrM-e"
    
    static var Api_Key = "AIzaSyCEV_xXTXG7-aP9hY5R1a3R-BVT6M5IXYI"
    static let baseUrl = "https://www.googleapis.com/youtube/v3/search?q=Eminem&key=AIzaSyCEV_xXTXG7-aP9hY5R1a3R-BVT6M5IXYI"
    static var PLAYLIST_ID = "PLN1mxegxWPd3d8jItTyrAxwm-iq-KrM-e"
    
    
    case temp
//    case fetchAllCategories
//    case placeOrder(String)
//    case fetchCategoryDishes(String)
//    case fetchOrders
    
    var discription: String {
        switch self {
            
//        case .temp:
//            return "/playlists?part=snippet&id=\(Route.PLAYLIST_ID)&key=\(Route.Api_Key)"
            
        case .temp:
            return ""
//        case .placeOrder(let dishId): return "/orders/\(dishId)"
//        case .fetchCategoryDishes(let categoryId): return "/dishes/\(categoryId)"
//        case .fetchOrders: return "/orders"
        }
    }
}


fileprivate let channel_Id = ""
let app_Key = "AIzaSyCEV_xXTXG7-aP9hY5R1a3R-BVT6M5IXYI"
fileprivate let max_Results = "10"


fileprivate enum Part: String {
    case snippet = "snippet"
    case contentDetails = "contentDetails"
    case statistics = "statistics"
    case brandingSettings = "brandingSettings"
}


// App URLs for application

let BASE_URL = "https://www.googleapis.com/youtube/v3/"
let CHANNEL_URL = BASE_URL + "channels?part=" + Part.statistics.rawValue + "," + Part.contentDetails.rawValue + "," + Part.brandingSettings.rawValue + "&id="

let VIDEO_LIST_URL = BASE_URL + "playlistItems?part=" + Part.snippet.rawValue + "," + Part.contentDetails.rawValue + "&key=" + app_Key + "&maxResults=" + max_Results + "&playlistId="

let VIDEO_DETAIL_URL = BASE_URL + "videos?part=" + Part.statistics.rawValue + "," + Part.snippet.rawValue + "&id="
