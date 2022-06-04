//
//  PlaylistSecondCollectionViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import UIKit
import Kingfisher

class PlaylistSecondCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: PlaylistSecondCollectionViewCell.self)

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videolNameLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    func setup (video: VideoListItem) {
        videolNameLabel.text = video.name
        viewsLabel.text = video.viewsCount
        videoImageView.kf.setImage(with: video.image.asUrl)
    }

}

