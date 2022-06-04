//
//  HomeViewController.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import UIKit
import drawer_view

class HomeViewController: UIViewController {
        
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var playlistFirstCollectionView: UICollectionView!
    @IBOutlet weak var playlistSecondCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var playlist_1: [Video] = [
        .init(id: "id1", name: "Kalush", image: "https://zn.ua/img/forall/u/495/25/3df1994c268918ed33a990490bb74e0e.jpg", viewsCount: "100 000 000 000"),
        .init(id: "id1", name: "Maneskin", image: "https://upload.wikimedia.org/wikipedia/commons/3/3b/Maneskin_2018.jpg", viewsCount: "100 000 000 000"),
        .init(id: "id1", name: "Monatic", image: "https://pre-party.com.ua/thumbnails/89/8944882ebaa3310ab23e460a0fff2b1b.jpg", viewsCount: "100 000 000 000"),
        .init(id: "id1", name: "Potap", image: "https://showbiz.24tv.ua/resources/photos/news/202205/1987415.jpg?v=1653392240000&w=1200&h=675&fit=cover", viewsCount: "100 000 000 000")
    ]
    
    var playlist_2: [Video] = [
        .init(id: "id1", name: "Maneskin", image: "https://upload.wikimedia.org/wikipedia/commons/3/3b/Maneskin_2018.jpg", viewsCount: "100 000 000 000"),
        .init(id: "id1", name: "Kalush", image: "https://zn.ua/img/forall/u/495/25/3df1994c268918ed33a990490bb74e0e.jpg", viewsCount: "100 000 000 000"),
        .init(id: "id1", name: "Monatic", image: "https://pre-party.com.ua/thumbnails/89/8944882ebaa3310ab23e460a0fff2b1b.jpg", viewsCount: "100 000 000 000"),
        .init(id: "id1", name: "OG Buda", image: "https://www.songslyrics.ru/wp-content/uploads/2021/07/OG-Buda-5-624x429.jpg", viewsCount: "100 000 000 000")
    ]
    
    var channels: [Channel] = [
        .init(id: "id1", name: "OG Buda", image: "https://www.songslyrics.ru/wp-content/uploads/2021/07/OG-Buda-5-624x429.jpg", subscribers: "1 000 000"),
        .init(id: "id1", name: "Morgenstern", image: "https://www.iphones.ru/wp-content/uploads/2021/07/9F4CB47C-C8AF-4224-B828-2ED1D7645E23-1180x720.jpeg", subscribers: "1 000 000"),
        .init(id: "id1", name: "Egor Kreed", image: "https://m.the-flow.ru/uploads/images/origin/07/40/34/65/43/f1df60c.png", subscribers: "1 000 000"),
        .init(id: "id1", name: "Potap", image: "https://showbiz.24tv.ua/resources/photos/news/202205/1987415.jpg?v=1653392240000&w=1200&h=675&fit=cover", subscribers: "1 000 000")
    ]
        
    var scrollingTimer: Timer?
    var currentcellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistSecondCollectionView.dataSource = self
        playlistSecondCollectionView.delegate = self
        registerCells()
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)

        pageControl.numberOfPages = channels.count
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func registerCells() {
        playlistFirstCollectionView.register(UINib(nibName: PlaylistFirstCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PlaylistFirstCollectionViewCell.identifier)
        playlistSecondCollectionView.register(UINib(nibName: PlaylistSecondCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PlaylistSecondCollectionViewCell.identifier)
        channelCollectionView.register(UINib(nibName: ChannelCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChannelCollectionViewCell.identifier)
    }
    
    @objc func slideToNext() {
        
        if currentcellIndex < channels.count - 1 {
            currentcellIndex = currentcellIndex + 1
        } else {
            currentcellIndex = 0
        }
        
        pageControl.currentPage = currentcellIndex
        
        channelCollectionView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case playlistFirstCollectionView:
            return playlist_1.count
        case playlistSecondCollectionView:
            return playlist_2.count
        case channelCollectionView:
            return channels.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case playlistFirstCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistFirstCollectionViewCell.identifier, for: indexPath) as! PlaylistFirstCollectionViewCell
            cell.setup(video: playlist_1[indexPath.row])
            return cell
        case playlistSecondCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistSecondCollectionViewCell.identifier, for: indexPath) as! PlaylistSecondCollectionViewCell
            cell.setup(video: playlist_2[indexPath.row])
            return cell
        case channelCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as! ChannelCollectionViewCell
            cell.setup(channel: channels[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == channelCollectionView {
            let controller = ListVideoViewController.instantiate()
            controller.channel = channels[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = PlayerViewController.instantiate()
            controller.video = collectionView == playlistFirstCollectionView ? playlist_1[indexPath.row] : playlist_2[indexPath.row]
            navigationController?.present(controller, animated: true, completion: nil)
            //navigationController?.pushViewController(controller, animated: true)

        }
    }
}
