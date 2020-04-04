//
//  VideoModel.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import Foundation
import UIKit


struct VideoModel : Codable {
    var name : String
    var url : String
    var thumbUrl : String
    var duration : CGFloat
}
