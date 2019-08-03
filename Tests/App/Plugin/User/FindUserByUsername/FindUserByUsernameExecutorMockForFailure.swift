//
//  FindUserByUsernameExecutorMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 02/08/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class FindUserByUsernameExecutorMockForFailure: FindUserByUsernameExecutorMock {
    override func executeFindUserByUsername(_ username: String) throws -> User {
        _ = try super.executeFindUserByUsername(username)
        throw FindUserByUsernameExecutorError.errorExecutingFindUserByUsername
    }
}
