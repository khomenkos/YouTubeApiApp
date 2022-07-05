//
//   Songs.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import Foundation


//struct Video: Decodable {
//    let id, name, image: String?
//    let viewsCount: String?
//    var formattedViewsCount: String {
//        return "\(viewsCount ?? "") просмотров"
//    }
//}

public struct Video: Decodable {
    let kind: String?
    let etag: String?
    let items: [Items]?
}

public struct Items: Decodable {
    let kind: String?
    let etag: String?
    let snippet: Snippet?
    let statistics: Statistics?
    let id: String
    let contentDetails: ContentDetails?
}

public struct Snippet: Decodable {
    let publishedAt: String?
    let channelId: String?
    let title: String?
    let description: String?
    let thumbnails: Thumbnails?
    let channelTitle: String?
}

public struct Statistics: Decodable {
    let viewCount: String?
}

public struct Thumbnails: Decodable {
    let medium: ThumbnailInfo?
    let high: ThumbnailInfo?
    let standard: ThumbnailInfo?
    let maxres: ThumbnailInfo?
}

public struct ThumbnailInfo: Decodable {
    let url: String
    let width: Int?
    let height: Int?
}

