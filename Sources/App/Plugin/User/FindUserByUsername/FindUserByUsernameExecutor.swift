//
//  FindUserByUsernameExecutor.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 28/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol FindUserByUsernameExecutor {
    func executeFindUserByUsername(_ username: String) throws -> User
}
