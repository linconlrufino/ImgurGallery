//
//  GalleryService.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 24/02/24.
//

import Foundation
import Alamofire

protocol GalleryServiceProtocol {
    func getImages(completionHandler: @escaping (ImageResponse) -> ())
    func urlPage(page: Int) -> String
}

class GalleryService: GalleryServiceProtocol {
    let ClientId = "9e6db4ec707f8f3"
    let baseUrl = "https://api.imgur.com/3/gallery/search/top"
        
    func getImages(completionHandler: @escaping (ImageResponse) -> ()) {
        let url = urlPage(page: 1)
        let headers: HTTPHeaders = ["Authorization": "Client-ID \(ClientId)"]
        
        AF.request(url, headers: headers).responseDecodable(of: GalleryData.self) { [weak self] response in
            guard let self else { return }

            switch response.result {
            case .success(let data):
                completionHandler(ImageResponse(success: data.success, images: data.data))
            case .failure(_):
                completionHandler(ImageResponse(success: false, images: []))
            }
        }
    }
    
    func urlPage(page: Int) -> String {
        return "\(baseUrl)/\(page)?q=cats&images!=null"
    }
}
