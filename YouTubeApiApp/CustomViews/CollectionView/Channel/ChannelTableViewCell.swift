//
//  ChannelTableViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 04.07.2022.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {

    static let identifier = String(describing: ChannelTableViewCell.self)

    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var channelPageControl: UIPageControl!
    
    
    var channels: [ChannelItem] = []
    var openUploadsTappedCallback: ((Int) -> ())? = nil
    var scrollingTimer = Timer()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        
        channelCollectionView.register(UINib.init(nibName: "ChannelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChannelCollectionViewCell")
        
        let screenSize = UIScreen.main.bounds
        let cellSize = CGSize(width: screenSize.width - 36, height: 180)
        channelCollectionView.collectionViewLayout = ChannelCollectionViewFlowLayout(itemSize: cellSize, lineSpacing: 36);
        channelCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollChannels), userInfo: nil, repeats: true)
    }
    
    @objc func scrollChannels() {
        var newRow = 0
        if channelPageControl.currentPage < channels.count - 1 {
            newRow = channelPageControl.currentPage + 1
        }
        let newIndexPath = IndexPath(row: newRow, section: 0)
        channelCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(channel: [ChannelItem]) {
        channels = channel
        channelPageControl.numberOfPages = channel.count
        channelCollectionView.reloadData()
    }

}

extension ChannelTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let channelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCollectionViewCell", for: indexPath) as! ChannelCollectionViewCell
        
        channelCell.setup(channel: self.channels[indexPath.row])
        
        return channelCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.openUploadsTappedCallback?(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        if let ip = self.channelCollectionView.indexPathForItem(at: center) {
            self.channelPageControl.currentPage = ip.row
        }
    }
    
}
