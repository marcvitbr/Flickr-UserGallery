//
//  FindUserByUsernameTests.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 24/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import XCTest

final class FindUserByUsernameTests: XCTestCase {
    private let receiverMock = UserReceiverMock()

    private let username = "eyetwist"

    func testFindUserSuccessfully() {
        let finderMock = UserFinderMock()

        let findUser = FindUserByUsername(finder: finderMock,
                                          receiver: self.receiverMock)

        findUser.execute(with: self.username)

        XCTAssertEqual(finderMock.callsToFindUser, 1)

        XCTAssertEqual(self.receiverMock.callsToReceiveUser, 1)
    }

    func testProblemWhenFindingUser() {
        let finderMock = UserFinderMockForFailure()

        let findUser = FindUserByUsername(finder: finderMock,
                                          receiver: self.receiverMock)

        findUser.execute(with: self.username)

        XCTAssertEqual(finderMock.callsToFindUser, 1)

        XCTAssertEqual(self.receiverMock.callsToHandleErrorFindingUser, 1)
    }
}
