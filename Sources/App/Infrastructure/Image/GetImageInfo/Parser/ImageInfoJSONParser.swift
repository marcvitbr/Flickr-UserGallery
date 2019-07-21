//
//  ImageInfoJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

protocol ImageInfoJSONParser {
    func parse(from json: [String: Any]) throws -> ImageInfo
}
