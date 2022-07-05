//
//  VideoCollectionViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 04.07.2022.
//

import UIKit
import Kingfisher

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoNameLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    static let identifier = String(describing: VideoCollectionViewCell.self)
    
    func setup (video: Items) {
        videoNameLabel.text = video.snippet?.title
        viewsLabel.text = video.statistics?.viewCount
        videoImageView.kf.setImage(with: video.snippet?.thumbnails?.high?.url.asUrl)
    }

}
