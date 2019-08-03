//
//  UserFinderMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 24/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class UserFinderMock: UserFinder {
    var callsToFindUser = 0

    func findUser(_ username: String) throws -> User {
        self.callsToFindUser += 1
        return UserFixture.validUser
    }
}
