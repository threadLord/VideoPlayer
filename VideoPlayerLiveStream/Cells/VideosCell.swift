//
//  VideosCell.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 02/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit

class VideosCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var upperLabel: UILabel!
    @IBOutlet weak var lowerLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftImageView.contentMode = .scaleAspectFit
        styling()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func applyVideos(_ videos: VideoModel) {
        upperLabel.text = videos.name
        lowerLabel.text = durationApply(duration: videos.duration)
        setImageWith(url: videos.thumbUrl)
    }
    
    func applyList(_ videos: Video) {
        upperLabel.text = videos.name
        lowerLabel.text = durationApply(duration: videos.duration)
        leftImageView.image = videos.thumbImage
        addPlayImageView()
    }
    
    private func durationApply(duration: Double) -> String {
        return String(duration).replacingOccurrences(of: ".", with: ":")
    }
    
    private func setImageWith(url: String) {
        leftImageView.imageFromUrlAndContentMode(url, aspect: .scaleAspectFit)
    }
    
    private func addPlayImageView() {
        guard leftImageView.subviews.count == 0 else { return }
        let playimageView = UIImageView()
        playimageView.frame.size = CGSize(width: 30, height: 30)
        playimageView.frame.origin.x = (leftImageView.frame.size.width + leftImageView.frame.origin.x * 2) / 2 + playimageView.frame.size.width / 2
        playimageView.frame.origin.y = self.frame.maxY / 2 - playimageView.frame.size.height / 2
        playimageView.image = UIImage(named: "playButton")
        playimageView.contentMode = .scaleAspectFit
//        playimageView.center = leftImageView.center
        leftImageView.addSubview(playimageView)
    }
    
    private func styling() {
        self.backgroundView?.layer.cornerRadius = 5.0
//        (red: 248/255, green: 248.255, blue: 248/255, alpha: 1.0)
        self.layer.borderColor = CGColor(srgbRed: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.layer.borderWidth = 2.0
    }
}
