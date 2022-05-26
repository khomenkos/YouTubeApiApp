//
//  ChannelCollectionViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import UIKit
import Kingfisher

class ChannelCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: ChannelCollectionViewCell.self)

    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    func setup (channel: Channel) {
        channelNameLabel.text = channel.name
        subLabel.text = channel.subscribers
        channelImageView.kf.setImage(with: channel.image.asUrl)
    }}
