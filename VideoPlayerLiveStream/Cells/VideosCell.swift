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
    }
    
    private func durationApply(duration: Double) -> String {
        return String(duration).replacingOccurrences(of: ".", with: ":")
    }
    
    private func setImageWith(url: String) {
        leftImageView.imageFromUrlAndContentMode(url, aspect: .scaleAspectFit)
    }
}
