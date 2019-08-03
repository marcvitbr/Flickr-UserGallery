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

    func testFindUserSuccessfully() {
        let fetchExecutorMock = FetchPublicImagesExecutorMock()

        let findUserExecutorMock = FindUserByUsernameExecutorMock()

        let assertSuccess = { XCTAssertEqual(self.screenMock.callsToPrepareScreenForFetchImages, 1) }

        self.exerciseFindUserAndAssert(findExecutor: findUserExecutorMock,
                                       fetchExecutor: fetchExecutorMock,
                                       assertion: assertSuccess)
    }

    func testErrorWhenFindingUser() {
        let fetchExecutorMock = FetchPublicImagesExecutorMock()

        let findUserExecutorMock = FindUserByUsernameExecutorMockForFailure()

        let assertFailure = { XCTAssertEqual(self.screenMock.callsToPresentErrorWhenFindingUser, 1) }

        self.exerciseFindUserAndAssert(findExecutor: findUserExecutorMock,
                                       fetchExecutor: fetchExecutorMock,
                                       assertion: assertFailure)
    }

    func testFetchImagesOfUser() {
        let fetchExecutorMock = FetchPublicImagesExecutorMock()

        let findUserExecutorMock = FindUserByUsernameExecutorMock()

        let assertSuccess = { XCTAssertEqual(self.screenMock.callsToPresentImages, 1) }

        self.exerciseFetchImagesAndAssert(findExecutor: findUserExecutorMock,
                                          fetchExecutor: fetchExecutorMock,
                                          assertion: assertSuccess)
    }

    func testErrorWhenFetchingImagesOfUser() {
        let fetchExecutorMock = FetchPublicImagesExecutorMockForFailure()

        let findUserExecutorMock = FindUserByUsernameExecutorMock()

        let assertFailure = { XCTAssertEqual(self.screenMock.callsToPresentErrorWhenFetchingImages, 1) }

        self.exerciseFetchImagesAndAssert(findExecutor: findUserExecutorMock,
                               fetchExecutor: fetchExecutorMock,
                               assertion: assertFailure)
    }

    private func exerciseFetchImagesAndAssert(findExecutor: FindUserByUsernameExecutorMock,
                                              fetchExecutor: FetchPublicImagesExecutorMock,
                                              assertion: () -> Void) {
        let presenter = GalleryPresenter(screen: self.screenMock,
                                         fetchExecutor: fetchExecutor,
                                         findUserExecutor: findExecutor)

        presenter.fetchImages(with: Query(userId: self.userId,
                                          page: 1))

        XCTAssertEqual(self.screenMock.callsToClearResultsView, 1)

        XCTAssertEqual(fetchExecutor.callsToExecuteFetch, 1)

        assertion()
    }

    private func exerciseFindUserAndAssert(findExecutor: FindUserByUsernameExecutorMock,
                                           fetchExecutor: FetchPublicImagesExecutorMock,
                                           assertion: () -> Void) {
        let presenter = GalleryPresenter(screen: self.screenMock,
                                         fetchExecutor: fetchExecutor,
                                         findUserExecutor: findExecutor)

        presenter.findUser("eyetwist")

        XCTAssertEqual(self.screenMock.callsToClearResultsView, 1)

        XCTAssertEqual(findExecutor.callsToExecuteFindUserByUsername, 1)

        assertion()
    }
}
