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

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func applyList(_ videos: Video) {
        upperLabel.text = videos.name
        lowerLabel.text = durationApply(duration: videos.duration)
        leftImageView.image = videos.thumbImage
    }
    
    private func durationApply(duration: Double) -> String {
        return String(duration).replacingOccurrences(of: ".", with: ":")
    }
    
    private func styling() {
        self.backgroundView?.layer.cornerRadius = 5.0
        self.layer.borderColor = CGColor(srgbRed: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.layer.borderWidth = 4.0
    }
}
