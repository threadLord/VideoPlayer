//
//  VideoViewController.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController, Storyboarded {
    
    
    var mainCoordinator : MainCoordinator?
    var dataForVideo : Video?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    deinit {
        
        print("Deinitializes Video Controller")
    }
    

}
