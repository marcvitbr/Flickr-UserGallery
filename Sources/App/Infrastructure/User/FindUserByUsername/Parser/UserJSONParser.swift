//
//  UserJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 30/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol UserJSONParser {
    func parse(from json: [String: Any], _ username: String) throws -> User
}
