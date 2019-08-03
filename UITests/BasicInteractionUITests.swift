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
        self.verifySearchBarAndTypeUserNameAndSearch()

        self.verifyGalleryAndTapImage()

        self.assertExists(in: self.app.images, identifier: "FullScreenImageView")
        self.assertExists(in: self.app.staticTexts, identifier: "ViewCountValueLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "CommentCountValueLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "DescriptionLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "DateTakenLabel")
        self.assertExists(in: self.app.staticTexts, identifier: "TitleLabel")

        self.verifyCloseButtonAndTapIt()
    }

    private func verifySearchBarAndTypeUserNameAndSearch() {
        let searchField = self.assertExists(in: self.app.searchFields)

        searchField.tap()
        searchField.typeText("eyetwist")

        let searchButton = self.assertExists(in: self.app.buttons, identifier: "Search")
        searchButton.tap()
    }

    private func verifyGalleryAndTapImage() {
        let collectionView = self.assertExists(in: self.app.collectionViews)
        let firstCell = self.assertExists(in: collectionView.cells).firstMatch
        firstCell.tap()
    }

    private func verifyCloseButtonAndTapIt() {
        let closeButton = self.assertExists(in: self.app.buttons, identifier: "Close")
        closeButton.tap()
    }

    @discardableResult
    private func assertExists(in query: XCUIElementQuery, identifier: String = "") -> XCUIElement {
        let element = identifier.isEmpty ? query.element : query[identifier]
        let elementExists = element.waitForExistence(timeout: 2)
        XCTAssert(elementExists, "Failed with element \(identifier)")
        return element
    }
}
