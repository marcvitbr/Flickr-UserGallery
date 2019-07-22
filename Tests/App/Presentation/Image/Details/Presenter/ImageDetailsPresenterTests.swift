//
//  ImageDetailsPresenterTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class ImageDetailsPresenterTests: XCTestCase {
    private let imageDetailsScreenMock = ImageDetailsScreenMock()

    private let imageId = "48274406512"

    func testGetInfoOfPhotoIdSuccessfully() {
        let getInfoExecutorMock = GetImageInfoExecutorMock()

        let assertSuccess = { XCTAssertEqual(self.imageDetailsScreenMock.callsToPresentDetails, 1) }

        self.exerciseAndAssert(executor: getInfoExecutorMock,
                               assertion: assertSuccess)
    }

    func testErrorGettingInfoOfPhotoId() {
        let getInfoExecutorMock = GetImageInfoExecutorMockForFailure()

        let assertFailure = { XCTAssertEqual(self.imageDetailsScreenMock.callsToPresentError, 1) }

        self.exerciseAndAssert(executor: getInfoExecutorMock,
                               assertion: assertFailure)
    }

    private func exerciseAndAssert(executor: GetImageInfoExecutorMock, assertion: () -> Void) {
        let presenter = ImageDetailsPresenter(screen: self.imageDetailsScreenMock,
                                              getInfoExecutor: executor)

        presenter.getImageInfo(of: self.imageId)

        XCTAssertEqual(self.imageDetailsScreenMock.callsToClearTexts, 1)

        XCTAssertEqual(executor.callsToExecuteGetImageInfo, 1)

        assertion()
    }
}
