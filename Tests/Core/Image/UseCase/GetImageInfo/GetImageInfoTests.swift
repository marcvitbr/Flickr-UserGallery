//
//  GetImageInfoTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class GetImageInfoTests: XCTestCase {
    private let receiverMock = ImageInfoReceiverMock()

    private let photoId = "48274406512"

    func testGetImageInfoSuccessfully() {
        let fetcherMock = ImageInfoFetcherMock()

        let getInfo = GetImageInfo(fetcher: fetcherMock,
                                   receiver: self.receiverMock)

        getInfo.execute(with: self.photoId)

        XCTAssertEqual(fetcherMock.callsToGetImageInfo, 1)

        XCTAssertEqual(self.receiverMock.callsToReceiveImageInfo, 1)
    }

    func testFailureWhenGettingImageInfo() {
        let fetcherMock = ImageInfoFetcherMockForFailure()

        let getInfo = GetImageInfo(fetcher: fetcherMock,
                                   receiver: self.receiverMock)

        getInfo.execute(with: self.photoId)

        XCTAssertEqual(fetcherMock.callsToGetImageInfo, 1)

        XCTAssertEqual(self.receiverMock.callsToHandleErrorGettingImageInfo, 1)
    }
}
