//
//  ListSongsViewController.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 26.05.2022.
//

import UIKit

class ListVideoViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var channel: ChannelItem!
    
    var playlist: [Items] = []
//    var playlist: [Video] = [
//        .init(id: "id1", name: "Maneskin", image: "https://upload.wikimedia.org/wikipedia/commons/3/3b/Maneskin_2018.jpg", viewsCount: "100 000 000 000"),
//        .init(id: "id1", name: "Kalush", image: "https://zn.ua/img/forall/u/495/25/3df1994c268918ed33a990490bb74e0e.jpg", viewsCount: "100 000 000 000"),
//        .init(id: "id1", name: "Monatic", image: "https://pre-party.com.ua/thumbnails/89/8944882ebaa3310ab23e460a0fff2b1b.jpg", viewsCount: "100 000 000 000"),
//        .init(id: "id1", name: "OG Buda", image: "https://www.songslyrics.ru/wp-content/uploads/2021/07/OG-Buda-5-624x429.jpg", viewsCount: "100 000 000 000")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = channel.brandingSettings?.channel?.title
        registerCells()
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ListVideoTableViewCell.identifier , bundle: nil), forCellReuseIdentifier: ListVideoTableViewCell.identifier)
    }
}

extension ListVideoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListVideoTableViewCell.identifier) as! ListVideoTableViewCell
        cell.setup(video: playlist[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PlayerViewController.instantiate()
        controller.video = playlist[indexPath.row]
        navigationController?.present(controller, animated: true, completion: nil)
    }
    
}
