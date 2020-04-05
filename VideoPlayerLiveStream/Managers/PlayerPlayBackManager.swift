//
//  PlayerPlayBackManager.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 05/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//


import UIKit
import AVFoundation

class AssetPlaybackManager: NSObject {
    
    static let sharedManager = AssetPlaybackManager()
    
    weak var delegate: AssetPlaybackDelegate?
    
    private let player = AVPlayer()
 
    private var readyForPlayback = false
    
    private var playerItemObserver: NSKeyValueObservation?
    
    private var urlAssetObserver: NSKeyValueObservation?
    
    private var playerObserver: NSKeyValueObservation?
    

    private var playerItem: AVPlayerItem? {
        willSet {
            guard let playerItemObserver = playerItemObserver else { return }
            
            playerItemObserver.invalidate()
            
            let notificationCenter = NotificationCenter.default
            notificationCenter.removeObserver(self, name: .TimebaseEffectiveRateChangedNotification, object: playerItem?.timebase)
            notificationCenter.removeObserver(self, name: .AVPlayerItemPlaybackStalled, object: playerItem)
        }
        
        didSet {
            playerItemObserver = playerItem?.observe(\AVPlayerItem.status, options: [.new, .initial]) { [weak self] (item, _) in
                guard let strongSelf = self else { return }
                
                if item.status == .readyToPlay {
                    if !strongSelf.readyForPlayback {
                        strongSelf.readyForPlayback = true
                        strongSelf.delegate?.streamPlaybackManager(strongSelf, playerReadyToPlay: strongSelf.player)
                    }
                } else if item.status == .failed {
                    let error = item.error
                    
                    print("Error: \(String(describing: error?.localizedDescription))")
                }
            }
        }
    }
    
    func stopPlayer() {
        player.pause()
    }
    
    private var asset: Video? {
        willSet {
            
            guard let urlAssetObserver = urlAssetObserver else { return }
            
            urlAssetObserver.invalidate()
        }
        
        didSet {
            if let asset = asset {
                urlAssetObserver = asset.assetURL?.observe(\AVURLAsset.isPlayable, options: [.new, .initial]) { [weak self] (urlAsset, _) in
                    guard let strongSelf = self, urlAsset.isPlayable == true else { return }
                    
                    strongSelf.playerItem = AVPlayerItem(asset: urlAsset)
                    strongSelf.player.replaceCurrentItem(with: strongSelf.playerItem)
                }
            } else {
                playerItem = nil
                player.replaceCurrentItem(with: nil)
                readyForPlayback = false
            }
        }
    }
    
    override private init() {
        super.init()
        playerObserver = player.observe(\AVPlayer.currentItem, options: [.new]) { [weak self] (player, _) in
            guard let strongSelf = self else { return }
            
            strongSelf.delegate?.streamPlaybackManager(strongSelf, playerCurrentItemDidChange: player)
        }
        
        player.usesExternalPlaybackWhileExternalScreenIsActive = true
    }
    
    deinit {
        playerObserver?.invalidate()
    }
   
    func setAssetForPlayback(_ asset: Video?) {
        self.asset = asset
    }
}


protocol AssetPlaybackDelegate: class {
    
    
    func streamPlaybackManager(_ streamPlaybackManager: AssetPlaybackManager, playerReadyToPlay player: AVPlayer)
    

    func streamPlaybackManager(_ streamPlaybackManager: AssetPlaybackManager, playerCurrentItemDidChange player: AVPlayer)
}

extension Notification.Name {

    static let TimebaseEffectiveRateChangedNotification = Notification.Name(rawValue: kCMTimebaseNotification_EffectiveRateChanged as String)
}
