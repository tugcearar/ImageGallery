//
//  ImageModel.swift
//  GalleryApp
//
//  Created by Tuğçe Arar on 2.06.2022.
//

import Foundation

struct ImageElement:  Decodable, Identifiable {
    let id, author: String?
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }


init(imageUrl: String) {
    id = "0"
    width = 0
    height = 0
    url = imageUrl
    author = ""
    downloadURL = ""
   }
}
typealias Image = [ImageElement]


