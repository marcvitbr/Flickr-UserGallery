//
//  DefaultImageSummaryJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class DefaultImageSummaryJSONParser: ImageSummaryJSONParser {
    func parse(from json: [String: Any]) throws -> [ImageSummary] {
        guard let photosRoot = json["photos"] as? [String: Any],
            let photos = photosRoot["photo"] as? [[String: Any]] else {
                throw ImageSummaryJSONParserError.errorParsingJSONtoImageSummaries
        }

        let toImageSummaries: ([String: Any]) -> ImageSummary? = { image in
            guard let photoId = image["id"] as? String,
                let title = image["title"] as? String else {
                    return nil
            }

            return ImageSummary(photoId: photoId, title: title)
        }

        let images = photos.map(toImageSummaries)
                           .compactMap { $0 }

        return images
    }
}
