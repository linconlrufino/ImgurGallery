//
//  ImgurGalleryUITests.swift
//  ImgurGalleryUITests
//
//  Created by Linconl Rufino on 25/02/24.
//

import XCTest

class ImgurGalleryUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLaunchScreenAndLoadImages() {
        let app = XCUIApplication()
        app.launch()

        let cell = XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0)
        
        cell.tap()

        XCTAssert(cell.exists)
    }
    
    func testTitleLabel() {
        let app = XCUIApplication()
        app.launch()
        
        let galleryCatsStaticText = app.staticTexts["Gallery Cats"]
        galleryCatsStaticText.tap()
        
        XCTAssert(galleryCatsStaticText.exists)
    }
    
    func testMoreCatsButton() {
        let app = XCUIApplication()
        app.launch()

        let moreCatsButton = app.buttons["More Cats"]

        moreCatsButton.tap()
        
        XCTAssert(moreCatsButton.exists)
    }
}
