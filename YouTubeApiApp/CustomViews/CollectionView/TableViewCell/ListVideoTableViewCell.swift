//
//  ListSongsTableViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 26.05.2022.
//

import UIKit

class ListVideoTableViewCell: UITableViewCell {

    static let identifier = "ListVideoTableViewCell"

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var viewsLbl: UILabel!
    
    func setup(video: Video) {
        videoImageView.kf.setImage(with: video.image.asUrl)
        titleLbl.text = video.name
        viewsLbl.text = video.viewsCount
    }
    
}
