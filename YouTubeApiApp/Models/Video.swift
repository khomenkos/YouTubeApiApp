//
//   Songs.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import Foundation


//struct Video {
//    let id, name, image, viewsCount: String
//}

struct yt :Decodable{
    let kind:String
    let regionCode:String
    let items:[items]
}
struct items:Decodable {
    let etag:String?
    let snippet:snippet
    let id:id!


}
struct snippet:Decodable {
    let title:String!
    let thumbnails:thumbnails

}
struct id:Decodable {
    let videoId:String!
}
struct thumbnails:Decodable {
    let medium:medium!
}
struct medium:Decodable {
    let url:String!
}
struct getYouTubeDownloadLink:Decodable {
    let file: String!
}
