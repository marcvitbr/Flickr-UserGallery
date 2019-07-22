//
//  GalleryPresenterTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class GalleryPresenterTests: XCTestCase {
    private let userId = "49191827@N00"

    private let screenMock = GalleryScreenMock()

    func testSearchImagesWithTerm() {
        let fetchExecutorMock = FetchPublicImagesExecutorMock()

        let assertSuccess = { XCTAssertEqual(self.screenMock.callsToPresentImages, 1) }

        self.exerciseAndAssert(executor: fetchExecutorMock,
                               assertion: assertSuccess)
    }

    func testErrorWhenSearchingImagesWithTerm() {
        let searchExecutorMock = FetchPublicImagesExecutorMockForFailure()

        let assertFailure = { XCTAssertEqual(self.screenMock.callsToPresentErrorWhenFetchingImages, 1) }

        self.exerciseAndAssert(executor: searchExecutorMock,
                               assertion: assertFailure)
    }

    private func exerciseAndAssert(executor: FetchPublicImagesExecutorMock, assertion: () -> Void) {
        let presenter = GalleryPresenter(screen: self.screenMock,
                                         fetchExecutor: executor)

        presenter.searchImages(with: Query(userId: self.userId,
                                           page: 1))

        XCTAssertEqual(self.screenMock.callsToClearResultsView, 1)

        XCTAssertEqual(executor.callsToExecuteFetch, 1)

        assertion()
    }
}
