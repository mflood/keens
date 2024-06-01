//
//  VideoDataLoader.swift
//  ok
//
//  Created by Flood on 2024/06/01.
//

import Foundation

class VideoDataLoader {
    static func loadVideos() -> [YouTubeVideo] {
        guard let url = Bundle.main.url(forResource: "videos", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let videoArray = try? PropertyListDecoder().decode([YouTubeVideo].self, from: data) else {
            return []
        }
        return videoArray
    }
}
