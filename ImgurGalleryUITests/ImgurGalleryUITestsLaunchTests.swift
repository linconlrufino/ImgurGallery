//
//  ImgurGalleryUITestsLaunchTests.swift
//  ImgurGalleryUITests
//
//  Created by Linconl Rufino on 25/02/24.
//

import XCTest

final class ImgurGalleryUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
