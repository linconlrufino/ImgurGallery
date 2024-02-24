//
//  Image.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 24/02/24.
//

import Foundation

struct GalleryData: Codable {
    var data: [Image]
    var success: Bool
    var status: Int
}

struct Image: Codable {
    var link: String
}

struct ImageResponse {
    let success: Bool
    let images: [Image]
}

enum ImageError: Error {
    case networkError
}
