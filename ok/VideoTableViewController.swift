//
//  YoutubeTableViewController.swift
//  ok
//
//  Created by Flood on 2024/06/01.
//

import UIKit

class VideoTableViewController: UITableViewController {
    
    var videos: [YouTubeVideo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load video data
        videos = VideoDataLoader.loadVideos()
        
        // Register a cell class
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "VideoCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        let video = videos[indexPath.row]
        
        cell.textLabel?.text = video.title
        cell.detailTextLabel?.text = video.url
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = videos[indexPath.row]
        if let url = URL(string: video.url) {
            UIApplication.shared.open(url)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
