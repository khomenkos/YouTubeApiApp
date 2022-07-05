//
//  NetworkService.swift
//  YouTubeApiApp
//
//  Created by  Sasha Khomenko on 27.05.2022.
//

import Foundation
import Alamofire

public class NetworkService {
    
    static let shared = NetworkService()
    
    public func getChannel(channelId: [String], completion: @escaping (Result<Channel>) -> Void) {
        var channelID = ""
        for item in channelId {
            channelID += item + ","
        }
        
        let urlString = CHANNEL_URL + channelID + "&key=" + app_Key


        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(Channel.self, from: data)
                    print(response)
                    completion(.success(response))
                } catch {
                    completion(.failure(APIError.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(APIError.networkError(internal: error)))
            }
        }
    }
    
    public func getPlaylist(playlistId: String, completion: @escaping (Result<PlaylistItems>) -> Void) {
        
        let urlString = VIDEO_LIST_URL + playlistId

        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(PlaylistItems.self, from: data)
                    print(response)
                    completion(.success(response))
                } catch {
                    completion(.failure(APIError.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(APIError.networkError(internal: error)))
            }
        }
    }
    
    public func getVideoList(videoId: [String], completion: @escaping (Result<Video>) -> Void) {
        
        var videoID = ""
        for item in videoId {
            videoID += item + ","
        }
        
        let urlString = VIDEO_DETAIL_URL + videoID + "&key=" + app_Key

        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(Video.self, from: data)
                    print(response)
                    completion(.success(response))
                } catch {
                    completion(.failure(APIError.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(APIError.networkError(internal: error)))
            }
        }
    }
}

