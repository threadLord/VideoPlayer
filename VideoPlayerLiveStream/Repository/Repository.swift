//
//  Repository.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 02/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import Foundation


class NetworkRepository {
    private let DomainURL = "http://www.mocky.io/v2/5e88c4953100007c00d39a96"
    
    static let shared = NetworkRepository()
    
    func getVideos(completionHandler: @escaping ([VideoModel]) -> (Void)) {
        
        let urlString = DomainURL 
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let data = data else { return }
                if let videos = try? JSONDecoder().decode([VideoModel].self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler(videos)
                    }
                }
            })
            task.resume()
        }
     
    }
}


