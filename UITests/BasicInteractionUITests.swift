//
//  BasicInteractionUITests.swift
//  Flickr-UserGalleryUITests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

class BasicInteractionUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false

        self.app = XCUIApplication()
        self.app.launch()
    }

    func testBasicAppInteraction() {
        self.verifyGalleryAndTapImage()

        self.assertExists(in: self.app.images, identifier: "FullScreenImageView")
        self.assertExists(in: self.app.staticTexts, identifier: "ViewCountValueLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "CommentCountValueLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "DescriptionLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "DateTakenLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "TitleLabel")

        self.verifyCloseButtonAndTapIt()
    }

    private func verifyGalleryAndTapImage() {
        let collectionView = self.app.collectionViews.element
        let collectionViewExists = collectionView.waitForExistence(timeout: 5)
        XCTAssert(collectionViewExists)

        let firstCell = collectionView.cells.firstMatch
        let firstCellExists = firstCell.waitForExistence(timeout: 10)
        XCTAssert(firstCellExists)
        firstCell.tap()
    }

    private func assertExists(in query: XCUIElementQuery, identifier: String) {
        let element = query[identifier]
        let elementExists = element.waitForExistence(timeout: 2)
        XCTAssert(elementExists, "Failed with element \(identifier)")
    }

    private func verifyCloseButtonAndTapIt() {
        let closeButton = self.app.buttons.firstMatch
        let closeButtonExists = closeButton.waitForExistence(timeout: 5)
        XCTAssert(closeButtonExists)

        closeButton.tap()
    }
}
