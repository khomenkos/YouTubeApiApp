//
//  Playlist.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 13.06.2022.
//

import Foundation

public struct PlaylistItems: Decodable {
    let items: [Playlist]
}

public struct Playlist: Decodable {
    let contentDetails: ContentDetails
}

public struct ContentDetails: Decodable {
    let videoId: String
}
