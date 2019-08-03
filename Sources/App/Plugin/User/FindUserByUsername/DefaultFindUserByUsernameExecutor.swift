//
//  DefaultFindUserByUsernameExecutor.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 28/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultFindUserByUsernameExecutor: FindUserByUsernameExecutor, UserReceiver, DependencyReceiver {
    private var semaphore: DispatchSemaphore!

    private var retrievedUser: User?

    private var isSuccess = false

    func executeFindUserByUsername(_ username: String) throws -> User {
        guard let defaultFinder = self.instance(of: UserFinder.self) else {
            throw FindUserByUsernameExecutorError.errorExecutingFindUserByUsername
        }

        self.resetExecutionFlags()

        let findUser = FindUserByUsername(finder: defaultFinder,
                                          receiver: self)

        findUser.execute(with: username)

        self.semaphore.wait()

        guard self.isSuccess, let user = self.retrievedUser else {
            throw FindUserByUsernameExecutorError.errorExecutingFindUserByUsername
        }

        return user
    }

    func receiveUser(_ user: User) {
        self.retrievedUser = user
        self.resumeExecution(success: true)
    }

    func handleErrorFindingUser() {
        self.retrievedUser = nil
        self.resumeExecution(success: false)
    }

    private func resetExecutionFlags() {
        self.isSuccess = false
        self.semaphore = DispatchSemaphore(value: 0)
    }

    private func resumeExecution(success: Bool) {
        self.isSuccess = success
        self.semaphore.signal()
    }
}
