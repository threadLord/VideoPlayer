//
//  Repository.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 02/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import Foundation


class NetworkRepository {
//    private let DomainURL = "http://localhost:3000/videos/"
    private let DomainURL = "http://www.mocky.io/v2/5e88c4953100007c00d39a96"
    
    
    
    static let shared = NetworkRepository()
    
    func getVideos(completionHandler: @escaping ([VideoModel]) -> (Void)) {
        
        let urlString = DomainURL 
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//                print(String.init(data: data!, encoding: .ascii) ?? "no data")
                guard let data = data else { return }
                
                if let videos = try? JSONDecoder().decode([VideoModel].self, from: data) {
                
//                    videos.forEach { print("Name: \($0.name)")
//                    }
//                    print (newMusic.guid ?? "no guid")
//                    print (newMusic.music_url ?? "no url")
                    completionHandler(videos)
                }
            })
            task.resume()
        }
     
    }
    
//
//    static func fetchAll(completionHandler: @escaping ([Music])->Void) {
//        let urlString = DomainURL + "music/"
//
//        if let url = URL.init(string: urlString) {
//            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//                print(String.init(data: data!, encoding: .ascii) ?? "no data")
//                if let newMusic = try? JSONDecoder().decode([Music].self, from: data!) {
//                    completionHandler(newMusic)
//                }
//            })
//            task.resume()
//        }
//    }
    
    
    
}

class MainContainer {
    
    let networkRepo = NetworkRepository.shared
    
    static let shared = MainContainer()
    
    func getData(completion: @escaping ([VideoModel]) -> ())  {
//        var videos : [VideoModel] = []
        networkRepo.getVideos { completion($0)}
//        return videos
    }
    
    
}
