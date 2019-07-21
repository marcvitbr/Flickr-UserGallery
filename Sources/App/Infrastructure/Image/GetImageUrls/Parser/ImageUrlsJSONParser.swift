//
//  ImageUrlsJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol ImageUrlsJSONParser {
    func parse(from json: [String: Any], _ photoId: String) throws -> ImageUrls
}
