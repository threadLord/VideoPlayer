//
//  MainContainer.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import Foundation

class MainContainer {
    
    let networkRepo = NetworkRepository.shared
    
    static let shared = MainContainer()
    
    func getData(completion: @escaping ([VideoModel]) -> ())  {
        networkRepo.getVideos { completion($0)}
    }
    
    
}
