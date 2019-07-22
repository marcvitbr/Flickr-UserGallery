//
//  ImageCellPresenterTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class ImageCellPresenterTests: XCTestCase {
    private let imageCellMock = ImageCellMock()

    private let imageId = "48274406512"

    func testGetUrlsOfPhotoIdSuccessfully() {
        let getUrlsExecutorMock = GetImageUrlsExecutorMock()

        let assertSuccess = { XCTAssertEqual(self.imageCellMock.callsToPresentImage, 1) }

        self.exerciseAndAssert(executor: getUrlsExecutorMock,
                               assertion: assertSuccess)
    }

    func testErrorObtainingDetailsOfPhotoId() {
        let getUrlsExecutorMock = GetImageUrlsExecutorMockForFailure()

        let assertFailure = { XCTAssertEqual(self.imageCellMock.callsToPresentPlaceholderImage, 1) }

        self.exerciseAndAssert(executor: getUrlsExecutorMock,
                               assertion: assertFailure)
    }

    private func exerciseAndAssert(executor: GetImageUrlsExecutorMock, assertion: () -> Void) {
        let presenter = ImageCellPresenter(cell: self.imageCellMock,
                                           getUrlsExecutor: executor)

        presenter.getImageUrls(of: self.imageId)

        XCTAssertEqual(executor.callsToExecuteGetImageUrls, 1)

        assertion()
    }
}
