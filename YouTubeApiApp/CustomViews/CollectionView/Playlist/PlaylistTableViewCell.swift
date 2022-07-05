//
//  PlaylistTableViewCell.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 04.07.2022.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    
    static let identifier = String(describing: PlaylistTableViewCell.self)
    
    @IBOutlet weak var playlistCollectionView: UICollectionView!
    
    var videoList: [Items] = []
    var openVideoTappedCallback: ((String, [Items]) -> ())? = nil

    override func awakeFromNib() {
        super.awakeFromNib()

        playlistCollectionView.delegate = self
        playlistCollectionView.dataSource = self
        
        playlistCollectionView.register(UINib.init(nibName: "VideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func changeCellHeight(height: CGFloat) {
        heightConstant.constant = height
        self.layoutIfNeeded()
    }
    
    func setup(video: [Items]) {
        videoList = video
        playlistCollectionView.reloadData()
    }
}

extension PlaylistTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let videoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        
        videoCell.setup(video: self.videoList[indexPath.row])
        
        return videoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoId = self.videoList[indexPath.row].id
        self.openVideoTappedCallback?(videoId, videoList)
    }
}

extension PlaylistTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.heightConstant.constant
        var width: CGFloat = 160
        if height != 117 {
            width = 135
        }
        return CGSize(width: width, height: height)
    }
}
