//
//  ApiRosponse.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 27.05.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T?
    let error: String?
}
