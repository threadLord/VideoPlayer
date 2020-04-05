//
//  VideosListViewController.swift
//  VideoPlayerLiveStream
//
//  Created by OSX on 04/04/2020.
//  Copyright © 2020 MarkoMutavdzic. All rights reserved.
//

import UIKit

class VideosListViewController: UIViewController, Storyboarded {

    @IBOutlet weak var VideosTableView: UITableView!

    var mainCoordinator : MainCoordinator?
    
    var viewModel = VideosListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VideosTableView.delegate = self
        self.VideosTableView.dataSource = self
        
        VideosTableView.register(UINib(nibName: "VideosCell", bundle: nil), forCellReuseIdentifier: "VideosCell")
        viewModel.delegate = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        VideosTableView.reloadData()
    }
    
    
    deinit {
        viewModel.delegate = nil
        print("List VC Deinitialized")
    }
}

extension VideosListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VideosTableView.dequeueReusableCell(withIdentifier: "VideosCell") as! VideosCell
        
        let dataForCell = viewModel.videosList[indexPath.row]
        cell.applyList(dataForCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToTransport = viewModel.videosList[indexPath.row]
        mainCoordinator!.videoController(dataForVideo: dataToTransport)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension VideosListViewController : VideosListViewModelDelegate {
    func dataUpdated() {
        VideosTableView.reloadData()
    }
}
