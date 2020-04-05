//
//  Video.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit
import AVKit

class Video {
    var name : String
    var url : String
    var thumbImage : UIImage?
    var duration : Double
    var assetURL : AVURLAsset?
    
    init(name: String, url: String, thumbImage: UIImage? = nil, duration: Double, assetUrl: AVURLAsset? = nil) {
        self.name = name
        self.url = url
        self.thumbImage = thumbImage
        self.duration = duration
        self.assetURL = assetUrl == nil ? getAsset() : assetUrl
    }
    
    func prepareAsset() {
        guard let urlForAsset = URL(string: url) else { return }
        assetURL = AVURLAsset(url: urlForAsset)
    }
    
    func getAsset() -> AVURLAsset? {
        guard let asset = assetURL else {
            guard let urlForAsset = URL(string: url) else { return nil}
              assetURL = AVURLAsset(url: urlForAsset)
            return assetURL
            }
        return asset
    }
}

