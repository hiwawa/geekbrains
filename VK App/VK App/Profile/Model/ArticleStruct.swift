//
//  ArticleStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 26/10/2020.
//

import Foundation

struct Article: Codable {
    var source: Source?
    var autor: String?
    var title: String?
    var description: String?
    var urlToImage: String?
    var content: String?
}
