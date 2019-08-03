//
//  DefaultUserJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 30/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class DefaultUserJSONParser: UserJSONParser {
    func parse(from json: [String: Any], _ username: String) throws -> User {
        guard let userRoot = json["user"] as? [String: Any],
            let nsid = userRoot["nsid"] as? String else {
            throw UserJSONParserError.errorParsingJSONtoUser
        }

        return User(username: username,
                    identifier: nsid)
    }
}
