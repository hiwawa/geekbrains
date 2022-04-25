//
//  NewsFeed.swift
//  VK App
//
//  Created by Aleksander Pankow on 26/10/2020.
//

import Foundation

struct NewsFeed : Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
