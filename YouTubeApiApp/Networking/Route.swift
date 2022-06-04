//
//  Route.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 27.05.2022.
//

import Foundation

enum Route {

    static var Api_Key = "AIzaSyCEV_xXTXG7-aP9hY5R1a3R-BVT6M5IXYI"
    static var baseUrl = "https:www.googleapis.com/youtube/v3/playlists?part=snippet&id=\(PLAYLIST_ID)&key=\(Api_Key)"
    static var PLAYLIST_ID = "PLN1mxegxWPd3d8jItTyrAxwm-iq-KrM-e"
    static var YT_EMBED_URL = "https:www.youtube.com/embed/"
    
//    case fetchAllCategories
//    case placeOrder(String)
//    case fetchCategoryDishes(String)
//    case fetchOrders
    
    var discription: String {
        switch self {
//        case .fetchAllCategories:
//            return "/dish-categories"
//        case .placeOrder(let dishId): return "/orders/\(dishId)"
//        case .fetchCategoryDishes(let categoryId): return "/dishes/\(categoryId)"
//        case .fetchOrders: return "/orders"
        }
    }
}
