//
//  GalleryViewModel.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 24/02/24.
//

import Foundation

struct GalleryViewModel {
    var images: Observable<[ImageViewCellViewModel]> = Observable([])
    var galleryService = GalleryService()

    
    public func getImages() {
        
        galleryService.getImages(){  response in
            if response.success {
                images.value = response.images.compactMap({
                    ImageViewCellViewModel(url: $0.link)
                })
            }
        }
    }
}
