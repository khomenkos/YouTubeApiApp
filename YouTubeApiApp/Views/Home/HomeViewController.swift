//
//  HomeViewController.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 25.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
        
    var playList: [Playlist] = []
    var videoList: [Items] = []
    var channels: [ChannelItem] = []
    
//    var channels: [ChannelItem] = [
//    .init(id: "1", statistics: ChannelStatistics.init(subscriberCount: "1"), brandingSettings: BrandingSettings.init(channel: ChannelInfo.init(title: "1"), image: ChannelImage.init(bannerExternalUrl: "https://avatars.githubusercontent.com/u/10806861")), contentDetails: ChannelContentDetails.init(relatedPlaylists: ChannelRelatedPlaylists.init(uploads: "1")), snippet: Snippet.init(publishedAt: "1", channelId: "1", title: "1", description: "1", thumbnails: Thumbnails.init(medium: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), high: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), standard: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), maxres: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1)), channelTitle: "1")),
//    .init(id: "1", statistics: ChannelStatistics.init(subscriberCount: "1"), brandingSettings: BrandingSettings.init(channel: ChannelInfo.init(title: "1"), image: ChannelImage.init(bannerExternalUrl: "https://avatars.githubusercontent.com/u/10806861")), contentDetails: ChannelContentDetails.init(relatedPlaylists: ChannelRelatedPlaylists.init(uploads: "1")), snippet: Snippet.init(publishedAt: "1", channelId: "1", title: "1", description: "1", thumbnails: Thumbnails.init(medium: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), high: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), standard: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), maxres: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1)), channelTitle: "1")),
//    .init(id: "1", statistics: ChannelStatistics.init(subscriberCount: "1"), brandingSettings: BrandingSettings.init(channel: ChannelInfo.init(title: "1"), image: ChannelImage.init(bannerExternalUrl: "https://avatars.githubusercontent.com/u/10806861")), contentDetails: ChannelContentDetails.init(relatedPlaylists: ChannelRelatedPlaylists.init(uploads: "1")), snippet: Snippet.init(publishedAt: "1", channelId: "1", title: "1", description: "1", thumbnails: Thumbnails.init(medium: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), high: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), standard: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), maxres: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1)), channelTitle: "1"))]
//
//    var videoList: [Items] = [
//        .init(kind: "1", etag: "1", snippet: Snippet.init(publishedAt: "1", channelId: "1", title: "githubusercontent", description: "1", thumbnails: Thumbnails.init(medium: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), high: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), standard: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), maxres: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1)), channelTitle: "1"), statistics: Statistics.init(viewCount: "50 000 000"), id: "1", contentDetails: ContentDetails.init(videoId: "1")),
//        .init(kind: "1", etag: "1", snippet: Snippet.init(publishedAt: "1", channelId: "1", title: "githubusercontent", description: "1", thumbnails: Thumbnails.init(medium: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), high: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), standard: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1), maxres: ThumbnailInfo.init(url: "https://avatars.githubusercontent.com/u/10806861", width: 1, height: 1)), channelTitle: "1"), statistics: Statistics.init(viewCount: "50 000 000"), id: "1", contentDetails: ContentDetails.init(videoId: "1"))
//    ]
    
    @IBOutlet weak var youtubeTableView: UITableView!
    
    let playlistId = "PLN1mxegxWPd0F2qVdZUBJ7mwWaHONMf6N"
    let playlistId1 = "PLN1mxegxWPd3Gtec8sCAsmSv_Gf9u0FEE"
    
    let channelId = ["UCEuOwB9vSL1oPKGNdONB4ig", "UCfM3zsQsOnfWNUppiycmBuw", "UCQjw3b3Ay5zMmEHUAxL93Rw", "UCeekxg1vju_sjIK9KjJJLYg"]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

        NetworkService.shared.getPlaylist(playlistId: playlistId1) { [weak self] (result) in
            switch result {
            case .success(let data):
                guard let self = self else { return }
                self.getVideolist(videos: data.items)
                self.youtubeTableView.reloadData()
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
        
        NetworkService.shared.getPlaylist(playlistId: playlistId) { [weak self] (result) in
            switch result {
            case .success(let data):
                guard let self = self else { return }
                self.getVideolist(videos: data.items)
                self.youtubeTableView.reloadData()
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
        
        NetworkService.shared.getChannel(channelId: channelId) { [weak self] (result) in
            switch result {
            case .success(let data):
                guard let self = self else { return }
                self.channels = data.items ?? []
                self.youtubeTableView.reloadData()
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
    }
    
    private func getVideolist(videos: [Playlist]) {
        var videoIds: [String] = []
        for item in videos {
            videoIds.append(item.contentDetails.videoId)
        }
        print("hello")
        print(videoIds)

        NetworkService.shared.getVideoList(videoId: videoIds) { [weak self] (result) in
            switch result {
            case .success(let data):
                guard let self = self else { return }
                self.videoList = data.items ?? []
                self.youtubeTableView.reloadData()

            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
    }
    
    private func registerCells() {
        
        youtubeTableView.delegate = self
        youtubeTableView.dataSource = self
        youtubeTableView.rowHeight = UITableView.automaticDimension
        youtubeTableView.estimatedRowHeight = 44
        
        youtubeTableView.register(UINib.init(nibName: "ChannelTableViewCell", bundle: nil), forCellReuseIdentifier: "ChannelTableViewCell")
        youtubeTableView.register(UINib.init(nibName: "PlaylistTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaylistTableViewCell")
    }
    
//    func openPlayer(videoId: String, playlist: [Items]) {
//        let newViewController = PlayerViewController.instantiate()
//
//        var allVideoIds: [String] = []
//        for item in playlist {
//            allVideoIds.append(item.id)
//        }
//
//        newViewController.presenter.allVideoIds = allVideoIds
//        newViewController.presenter.currentVideoId = videoId
//        newViewController.presenter.videoList = playlist
//
//        self.present(newViewController, animated: true, completion: nil)
//    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let channelsCell = tableView.dequeueReusableCell(withIdentifier: "ChannelTableViewCell", for: indexPath) as! ChannelTableViewCell
            channelsCell.setup(channel: channels)
            return channelsCell
        } else if indexPath.row == 1 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "PlaylistHeaderTableViewCell", for: indexPath) as! PlaylistHeaderTableViewCell
            return headerCell
        } else if indexPath.row == 2 {
            let playlistCell  = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell", for: indexPath) as! PlaylistTableViewCell
            playlistCell.setup(video: videoList)
            //playlistCell.changeCellHeight(height: 152)
            return playlistCell
        } else if indexPath.row == 3 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "PlaylistHeaderTableViewCell", for: indexPath) as! PlaylistHeaderTableViewCell
            return headerCell
        } else {
            let playlistCell  = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell", for: indexPath) as! PlaylistTableViewCell
            playlistCell.setup(video: videoList)
            return playlistCell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if let cell = cell as? PlaylistTableViewCell {
//            cell.openVideoTappedCallback = { [weak self] (videoId, allVideoIds) in
//                self?.openPlayer(videoId: videoId, playlist: allVideoIds)
//            }
//        }
    }
}
