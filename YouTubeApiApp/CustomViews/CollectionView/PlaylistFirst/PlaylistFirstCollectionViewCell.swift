//
//  PlaylistFirstCollectionViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import UIKit
import Kingfisher

class PlaylistFirstCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PlaylistFirstCollectionViewCell.self)

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoNameLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    func setup (video: Video) {
        videoNameLabel.text = video.name
        viewsLabel.text = video.viewsCount
        videoImageView.kf.setImage(with: video.image.asUrl)
    }

}
