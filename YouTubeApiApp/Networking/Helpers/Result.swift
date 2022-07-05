//
//  Result.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 08.06.2022.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
