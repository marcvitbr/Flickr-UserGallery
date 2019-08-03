//
//  UserFinderMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 24/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class UserFinderMockForFailure: UserFinderMock {
    override func findUser(_ username: String) throws -> User {
        _ = try? super.findUser(username)
        throw UserFinderError.errorFindingUser
    }
}
