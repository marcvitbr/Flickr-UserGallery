//
//  ObtainImageDetailsTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class ObtainImageDetailsTests: XCTestCase {
    private let receiverMock = ImageDetailsReceiverMock()

    private let photoId = "48274406512"

    func testObtainImageDetailsSuccessfully() {
        let fetcherMock = ImageDetailsFetcherMock()

        let obtainDetails = ObtainImageDetails(fetcher: fetcherMock,
                                               receiver: self.receiverMock)

        obtainDetails.execute(with: self.photoId)

        XCTAssertEqual(fetcherMock.callsToObtainImageDetails, 1)

        XCTAssertEqual(self.receiverMock.callsToReceiveImageDetails, 1)
    }

    func testFailureWhenObtainingImageDetails() {
        let fetcherMock = ImageDetailsFetcherMockForFailure()

        let obtainDetails = ObtainImageDetails(fetcher: fetcherMock,
                                               receiver: self.receiverMock)

        obtainDetails.execute(with: self.photoId)

        XCTAssertEqual(fetcherMock.callsToObtainImageDetails, 1)

        XCTAssertEqual(self.receiverMock.callsToHandleErrorObtainingImageDetails, 1)
    }
}
