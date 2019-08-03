//
//  DefaultUserFinder.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 30/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultUserFinder: UserFinder {
    private static var cache = [String: User]()

    private let httpClient: HTTPClient

    private let parser: UserJSONParser

    init(httpClient: HTTPClient, parser: UserJSONParser) {
        self.httpClient = httpClient
        self.parser = parser
    }

    func findUser(_ username: String) throws -> User {
        if let cachedInfo = DefaultUserFinder.cache[username] {
            return cachedInfo
        }

        let parameters = FlickrInfoProvider.parametersForFindUserMethod(username: username)

        let result = self.httpClient.get(FlickrInfoProvider.apiURL, parameters: parameters)

        guard case .success(let userJson) = result,
            let user = try? self.parser.parse(from: userJson, username) else {
                throw UserFinderError.errorFindingUser
        }

        DefaultUserFinder.cache[username] = user

        return user
    }
}
