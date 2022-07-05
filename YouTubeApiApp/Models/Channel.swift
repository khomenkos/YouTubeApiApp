//
//  Channel.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import Foundation

public struct Channel: Decodable {
    let items: [ChannelItem]?
}

public struct ChannelItem: Decodable {
    let id: String
    let statistics: ChannelStatistics?
    let brandingSettings: BrandingSettings?
    let contentDetails: ChannelContentDetails?
    let snippet: Snippet?
}

public struct ChannelContentDetails: Decodable {
    let relatedPlaylists: ChannelRelatedPlaylists?
}

public struct ChannelRelatedPlaylists: Decodable {
    let uploads: String?
}

public struct BrandingSettings: Decodable {
    let channel: ChannelInfo?
    let image: ChannelImage?
}

public struct ChannelInfo: Decodable {
    let title: String?
}

struct ChannelImage: Decodable {
    let bannerExternalUrl: String?
}

public struct ChannelStatistics: Decodable {
    let subscriberCount: String?
}
