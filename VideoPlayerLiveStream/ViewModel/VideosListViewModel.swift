//
//  VideosListViewModel.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit


protocol VideosListViewModelDelegate : class {
    func dataUpdated()
}

class VideosListViewModel {
    
    weak var delegate : VideosListViewModelDelegate?
    var mainContainer = MainContainer.shared
    
    var videosList : [Video] = [] {
        didSet {
            delegate?.dataUpdated()
        }
    }
    init() {
        getImgs()
    }
    
    func getImgs() {
        mainContainer.getVideos{ [weak self] in
                guard let self = self else { return }
                self.videosList = $0
            }
        }
}
