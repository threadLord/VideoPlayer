//
//  VideoViewController.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit
import AVKit


class VideoViewController: UIViewController, Storyboarded {
    
    
    var mainCoordinator : MainCoordinator?
    var dataForVideo : Video?
    
    private lazy var playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerController.view.frame = CGRect(x: self.view.frame.origin.x,
                                             y: self.view.frame.origin.y,
                                             width: self.view.frame.width,
                                             height: self.view.frame.width * 9/16)
        add(playerController)
      
    }
    
    
    deinit {
        
        print("Deinitializes Video Controller")
    }
    

}


