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

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DesctiptionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    var mainCoordinator : MainCoordinator?
    var dataForVideo : Video?
    
    var playerViewController : AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerViewController = AVPlayerViewController()
        
        playerViewController?.view.frame = CGRect(x: self.view.frame.origin.x,
                                             y: self.view.frame.origin.y,
                                             width: self.view.frame.width,
                                             height: self.view.frame.width * 9/16)
        add(playerViewController!)
        
        AssetPlaybackManager.sharedManager.delegate = self
        AssetPlaybackManager.sharedManager.setAssetForPlayback(dataForVideo)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        AssetPlaybackManager.sharedManager.delegate = nil
        playerViewController?.removeFromParent()
        AssetPlaybackManager.sharedManager.stopPlayer()
    }
    
    deinit {
        
        print("Deinitializes Video Controller")
    }
}

extension VideoViewController {
    
    func setupUI() {
        heightConstraint.constant = self.view.frame.width * 9/16
        let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        let durationString = durationApply(duration: dataForVideo?.duration ?? 0.00)
        
        TitleLabel.text = dataForVideo?.name
        DesctiptionLabel.text = description
        durationLabel.text = "Duration : \(durationString)"
    }
        
    private func durationApply(duration: Double) -> String {
        return String(duration).replacingOccurrences(of: ".", with: ":")
    }
}

extension VideoViewController: AssetPlaybackDelegate {
    func streamPlaybackManager(_ streamPlaybackManager: AssetPlaybackManager, playerReadyToPlay player: AVPlayer) {
        player.play()
    }

    func streamPlaybackManager(_ streamPlaybackManager: AssetPlaybackManager,
                               playerCurrentItemDidChange player: AVPlayer) {
        guard let playerViewController = playerViewController, player.currentItem != nil else { return }
        playerViewController.player = player
    }
}
