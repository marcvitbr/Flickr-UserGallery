//
//  ImageSummaryJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol ImageSummaryJSONParser {
    func parse(from json: [String: Any]) throws -> [ImageSummary]
}
