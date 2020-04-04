//
//  VideosListViewController.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit

class VideosListViewController: UIViewController {

    
    @IBOutlet weak var VideosTableView: UITableView!
    var mainContainer = MainContainer.shared
    
    var viewModel : VideosListViewModel?
    
//    var data : [VideoModel] = [] {
//        didSet {
//            VideosTableView.reloadData()
//        }
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VideosTableView.register(UINib(nibName: "VideosCell", bundle: nil), forCellReuseIdentifier: "VideosCell")
        guard let VideosTableView = VideosTableView else { return }
        print("Initialized")
        viewModel = VideosListViewModel(tableView: VideosTableView)
        
//        mainContainer.getData { [weak self] in
//            guard let self = self else { return }
//            self.data = $0
//            
////
//        }
       self.VideosTableView.delegate = self
       self.VideosTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        VideosTableView.reloadData()
    }
    
    
    deinit {
        print("List VC Deinitialized")
    }
}

extension VideosListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.videosList.count ?? 0
//        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VideosTableView.dequeueReusableCell(withIdentifier: "VideosCell") as! VideosCell
        
        guard let dataForCell = viewModel?.videosList[indexPath.row] else { return cell}
//        let dataForCell = data[indexPath.row]
        
        print("Cells")
        cell.applyVideos(dataForCell)
        
        return cell
    }
    
    
    
    
    
}



