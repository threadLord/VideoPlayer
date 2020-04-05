//
//  MainCoordinator.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 05/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit

class MainCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = VideosListViewController.instantiate()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func videoController() {
        let vc = VideoViewController.instantiate()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func backToList() {
        guard let lastController = navigationController.viewControllers.last else { return }
        if lastController.isKind(of: VideoViewController.self)  {
            navigationController.popViewController(animated: true)
        }
    }
    
}
