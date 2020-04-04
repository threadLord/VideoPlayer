//
//  UIImage+Download.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit

extension UIImageView {
    func imageFromUrlAndContentMode(_ imgURLString: String?, aspect: ContentMode) {
        self.image = nil
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        guard let url = URL(string: imageURLString) else {self.image = UIImage(named: "default.png");return}
        
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                    self?.contentMode = aspect
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "default.png")
                }
            }
        }
    }
    
}
