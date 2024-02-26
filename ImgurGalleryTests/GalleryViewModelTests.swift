//
//  GalleryViewModelTests.swift
//  ImgurGalleryTests
//
//  Created by Linconl Rufino on 25/02/24.
//

import XCTest
@testable import ImgurGallery

final class GalleryViewModelTests: XCTestCase {

    var sut: GalleryViewModel!
    
    override func setUpWithError() throws {
        let mockResponse = ImageResponse(success: true, images: [Image(link: "mockLink", type: "mockType")])
        sut = GalleryViewModel(galleryService: MockGalleryService(mockResponse: mockResponse))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetImages() {
        sut.getImages(page: 1)

        XCTAssertNotNil(sut.images.value)
        XCTAssertEqual(sut.images.value!.count, 1)
    }

    func testGetMoreImages() {
        sut.getImages(page: 1)
        sut.getMoreImages()

        XCTAssertNotNil(sut.images.value)
        XCTAssertEqual(sut.images.value!.count, 2)
    }

}

class MockGalleryService: GalleryServiceProtocol {
    let mockResponse: ImageResponse

    init(mockResponse: ImageResponse) {
        self.mockResponse = mockResponse
    }

    func getImages(page: Int, completionHandler: @escaping (ImageResponse) -> ()) {
        completionHandler(mockResponse)
    }

    func urlPage(page: Int) -> String {
        return "mockedURL"
    }
}
