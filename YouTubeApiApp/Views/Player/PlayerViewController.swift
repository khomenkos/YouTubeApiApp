//
//  PlayerViewController.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 26.05.2022.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    var video: Video!
    
    
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var volumeSlider: UISlider!
    
//    var playlist_1: [Video] = [
//        .init(id: "id1", name: "Kalush", image: "https://zn.ua/img/forall/u/495/25/3df1994c268918ed33a990490bb74e0e.jpg", viewsCount: "100 000 000 000"),
//        .init(id: "id1", name: "Maneskin", image: "https://upload.wikimedia.org/wikipedia/commons/3/3b/Maneskin_2018.jpg", viewsCount: "100 000 000 000"),
//        .init(id: "id1", name: "Monatic", image: "https://pre-party.com.ua/thumbnails/89/8944882ebaa3310ab23e460a0fff2b1b.jpg", viewsCount: "100 000 000 000"),
//        .init(id: "id1", name: "Potap", image: "https://showbiz.24tv.ua/resources/photos/news/202205/1987415.jpg?v=1653392240000&w=1200&h=675&fit=cover", viewsCount: "100 000 000 000")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        videoTitleLabel.text = video.name
        viewsLabel.text = video.viewsCount
    }

    
    @IBAction func playPauseAction(_ sender: Any) {
    }
    
    @IBAction func previousTrack(_ sender: Any) {
    }
    
    @IBAction func nextTrack(_ sender: Any) {
    }
    
    @IBAction func handleCurrentTimeSlider(_ sender: Any) {
    }
    
    @IBAction func handleVolumeSlider(_ sender: Any) {
        
    }
    
}
