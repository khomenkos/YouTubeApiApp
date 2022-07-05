//
//  Presenter.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 04.07.2022.
//
import UIKit

class PlayerPresenter<V: PlayerView>: Presenter {
    typealias View = V
    
    weak var view: View!
    
    var currentVideoId: String = ""
    var videoList: [Items] = []
    var allVideoIds: [String] = []
    
    required init(view: View) {
        self.view = view
        
    }
}

protocol PlayerView: View {
    func update()
}

protocol Presenter: AnyObject {
    associatedtype View
    var view: View! { get }
    init(view: View)
}

protocol View: AnyObject {
    associatedtype Presenter
    var presenter: Presenter! { get set }
}
