//
//  UserReceiverMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 24/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class UserReceiverMock: UserReceiver {
    var callsToReceiveUser = 0

    var callsToHandleErrorFindingUser = 0

    func receiveUser(_ user: User) {
        self.callsToReceiveUser += 1
    }

    func handleErrorFindingUser() {
        self.callsToHandleErrorFindingUser += 1
    }
}
