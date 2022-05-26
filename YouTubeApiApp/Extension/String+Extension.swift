//
//  String+Extension.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

