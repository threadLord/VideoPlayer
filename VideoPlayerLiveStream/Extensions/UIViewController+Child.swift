//
//  UIViewController+Child.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 05/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit
import AVKit

@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension AVPlayerViewController {

    func goFullScreen() {
        let selector = NSSelectorFromString("_transitionToFullScreenViewControllerAnimated:completionHandler:")
        if self.responds(to: selector) {
            // first argument is animated (true for me), second is completion handler (nil in my case)
            self.perform(selector, with: true, with: nil)
        }
    }
}

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
