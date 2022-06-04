//
//  Playlist.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import Foundation
import UIKit

struct Playlist: Decodable {
    struct PlaylistContentDetails: Decodable {
        let videoId: String
        
        enum CodingKeys: String, CodingKey {
            case videoId
        }
    }
    
    let contentDetails: PlaylistContentDetails
    
    enum CodingKeys: String, CodingKey {
        case contentDetails
    }
}
