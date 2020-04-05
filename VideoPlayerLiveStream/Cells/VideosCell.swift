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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func applyVideos(_ videos: VideoModel) {
        upperLabel.text = videos.name
        lowerLabel.text = durationApply(duration: videos.duration)
        setImageWith(url: videos.thumbUrl)
    }
    
    func applyList(_ videos: Video) {
        
    }
    
    private func durationApply(duration: Double) -> String {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        numberFormatter.minimumFractionDigits = 3
//        numberFormatter.maximumFractionDigits = 3
//        let s = numberFormatter.string(from: duration)
        return String(duration).replacingOccurrences(of: ".", with: ":")
        
    }
    
    private func setImageWith(url: String) {
        leftImageView.imageFromUrlAndContentMode(url, aspect: .scaleAspectFit)
    }
    
    
}
