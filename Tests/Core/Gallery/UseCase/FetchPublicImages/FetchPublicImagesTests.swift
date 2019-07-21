//
//  FetchPublicImagesTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class FetchPublicImagesTests: XCTestCase {
    private let receiverMock = PublicImagesReceiverMock()

    func testObtainImageDetailsSuccessfully() {
        let fetcherMock = PublicImagesFetcherMock()

        let fetch = FetchPublicImages(fetcher: fetcherMock,
                                      receiver: self.receiverMock)

        fetch.execute(with: QueryFixture.validQuery)

        XCTAssertEqual(fetcherMock.callsToFetchImages, 1)

        XCTAssertEqual(self.receiverMock.callsToReceiveImages, 1)
    }

    func testFailureWhenObtainingImageDetails() {
        let fetcherMock = PublicImagesFetcherMockForFailure()

        let fetch = FetchPublicImages(fetcher: fetcherMock,
                                      receiver: self.receiverMock)

        fetch.execute(with: QueryFixture.validQuery)

        XCTAssertEqual(fetcherMock.callsToFetchImages, 1)

        XCTAssertEqual(self.receiverMock.callsToHandleErrorFetchingImages, 1)
    }
}
