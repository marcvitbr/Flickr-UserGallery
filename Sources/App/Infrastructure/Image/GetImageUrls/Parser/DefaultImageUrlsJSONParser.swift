//
//  DefaultImageUrlsJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class DefaultImageUrlsJSONParser: ImageUrlsJSONParser {
    func parse(from json: [String: Any], _ photoId: String) throws -> ImageUrls {
        guard let sizesRoot = json["sizes"] as? [String: Any],
            let allSizes = sizesRoot["size"] as? [[String: Any]] else {
            throw ImageUrlsJSONParserError.errorParsingJSONtoImageUrls
        }

        let wantedSizes = allSizes.reduce([String: String]()) { (dict, size) in
            guard let label = size["label"] as? String,
                let urlPath = size["source"] as? String else {
                return dict
            }

            var newDict = dict
            newDict[label] = urlPath
            return newDict
        }

        guard let largeSquareUrlPath = wantedSizes["Large Square"],
            let largeUrlPath = wantedSizes["Large"] else {
                throw ImageUrlsJSONParserError.errorParsingJSONtoImageUrls
        }

        return ImageUrls(photoId: photoId,
                         largeSquareUrlPath: largeSquareUrlPath,
                         largeUrlPath: largeUrlPath)
    }
}
