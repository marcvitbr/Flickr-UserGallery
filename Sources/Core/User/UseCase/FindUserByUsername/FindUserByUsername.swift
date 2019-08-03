//
//  FindUserByUsername.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 24/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class FindUserByUsername: ParameterizedUseCase {
    typealias Parameter = String

    private weak var finder: UserFinder?
    private weak var receiver: UserReceiver?

    init(finder: UserFinder, receiver: UserReceiver) {
        self.finder = finder
        self.receiver = receiver
    }

    func execute(with parameters: String) {
        guard let user = try? self.finder?.findUser(parameters) else {
            self.receiver?.handleErrorFindingUser()
            return
        }

        self.receiver?.receiveUser(user)
    }
}
