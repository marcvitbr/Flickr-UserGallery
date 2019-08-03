//
//  FindUserByUsernameExecutorMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 31/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class FindUserByUsernameExecutorMock: FindUserByUsernameExecutor {
    var callsToExecuteFindUserByUsername = 0

    func executeFindUserByUsername(_ username: String) throws -> User {
        self.callsToExecuteFindUserByUsername += 1
        return UserFixture.validUser
    }
}
