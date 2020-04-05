//
//  MainContainer.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import Foundation
import UIKit
final class MainContainer {
    
    let networkRepo = NetworkRepository.shared
    
    static let shared = MainContainer()
    
    public func getData(completion: @escaping ([VideoModel]) -> ())  {
        networkRepo.getVideosData { completion($0)}
    }
    
    public func getVideos(completion: @escaping ([Video]) -> ()) {
        networkRepo.getVideosData { videoWithoutImage in
            let videos = videoWithoutImage.map { videoMod -> Video in
                
                let imageForVideo : UIImage? = {
                    var localImage : UIImage?
                    videoMod.thumbUrl.imageFromUrl { image in
                        localImage = image
                    }
                    return localImage
                }()
                return Video(name: videoMod.name, url: videoMod.url, thumbUrl: imageForVideo, duration: videoMod.duration)
            }
            completion(videos)
        }
    }
    
    
}
