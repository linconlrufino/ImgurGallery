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

    public func getImages(page: Int) {
        galleryService.getImages(page: page){  response in
            if response.success {
                
                let imagesResponse = response.images.compactMap({
                    Image(link: $0.link, type: $0.type )
                })
                
                let filteredImages = imagesResponse.filter({ $0.type != nil })
                
                images.value = filteredImages.compactMap({
                    ImageViewCellViewModel(url: $0.link)
                })
            }
        }
    }

    public func getMoreImages() {
        let randomPage = Int.random(in:  0...100)
        
        galleryService.getImages(page: randomPage){  response in
            if response.success {
                
                let imagesResponse = response.images.compactMap({
                    Image(link: $0.link, type: $0.type )
                })
                
                let filteredImages = imagesResponse.filter({ $0.type != nil })
                
                images.value?.append(contentsOf: filteredImages.compactMap({
                    ImageViewCellViewModel(url: $0.link)
                }))
            }
        }
    }
}
