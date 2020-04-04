//
//  VideosListViewModel.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit


class VideosListViewModel {
    
    var mainContainer = MainContainer.shared
    
    var videosList : [VideoModel] = [VideoModel(name: "11", url: "11", thumbUrl: "111", duration: 1.00)]
    var _updateFlag = false {
        didSet {
            updateTableView()
        }
    }
    var _tableView : UITableView
    
    init(tableView: UITableView) {
        self._tableView = tableView
        getImages()
    }
    
    
    func getImages() {
        mainContainer.getData { [weak self] in
            guard let self = self else { return }
            self.videosList = $0
//            self._updateFlag = !self._updateFlag
            $0.forEach { [ weak self] in
                guard let self = self else { return }
                
//                print("LALALA: \($0.name)")
                self.videosList.append($0)
                self._updateFlag = !self._updateFlag
//                print("FLAG: \(self._updateFlag)")
            }
            
        }
    }
    
    func updateTableView() {
        _tableView.reloadData()
    }
    
}
