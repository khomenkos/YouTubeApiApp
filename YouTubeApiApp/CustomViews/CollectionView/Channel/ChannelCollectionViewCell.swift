//
//  ChannelCollectionViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 04.07.2022.
//

import UIKit
import Kingfisher

class ChannelCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: ChannelCollectionViewCell.self)

    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    func setup (channel: ChannelItem) {
        channelNameLabel.text = channel.brandingSettings?.channel?.title
        subLabel.text = channel.statistics?.subscriberCount
        channelImageView.kf.setImage(with: channel.brandingSettings?.image?.bannerExternalUrl?.asUrl)
    }

}
