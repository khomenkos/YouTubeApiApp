//
//  UIView+Extensions.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//


import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set { self.layer.cornerRadius = newValue }
    }
}
