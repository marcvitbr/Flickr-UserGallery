//
//  DefaultImageInfoJSONParser.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultImageInfoJSONParser: ImageInfoJSONParser {
    private lazy var dateFormatter = DateFormatter()

    func parse(from json: [String: Any]) throws -> ImageInfo {
        guard let photoRoot = json["photo"] as? [String: Any],
            let photoId = photoRoot["id"] as? String else {
            throw ImageInfoJSONParserError.errorParsingJSONtoImageInfo
        }

        let title = self.extractTitle(from: photoRoot)
        let description = self.extractDescription(from: photoRoot)
        let dateTaken = self.extractDateTaken(from: photoRoot)
        let viewCount = self.extractViewCount(from: photoRoot)
        let commentCount = self.extractCommentCount(from: photoRoot)

        return ImageInfo(photoId: photoId,
                         title: title,
                         description: description,
                         dateTaken: dateTaken,
                         viewCount: viewCount,
                         commentCount: commentCount)
    }

    private func extractTitle(from photoRoot: [String: Any]) -> String {
        guard let titleRoot = photoRoot["title"] as? [String: Any],
            let titleValue = titleRoot["_content"] as? String else {
            return ""
        }

        return titleValue
    }

    private func extractDescription(from photoRoot: [String: Any]) -> String {
        guard let descriptionRoot = photoRoot["description"] as? [String: Any],
            let descriptionValue = descriptionRoot["_content"] as? String else {
            return ""
        }

        return descriptionValue
    }

    private func extractDateTaken(from photoRoot: [String: Any]) -> Date? {
        let datesRoot = photoRoot["dates"] as? [String: Any]
        let dateTakenText = (datesRoot?["taken"] as? String) ?? ""

        return self.dateFormatter.date(from: dateTakenText)
    }

    private func extractViewCount(from photoRoot: [String: Any]) -> String? {
        return photoRoot["views"] as? String
    }

    private func extractCommentCount(from photoRoot: [String: Any]) -> String? {
        let commentRoot = photoRoot["comments"] as? [String: Any]
        return commentRoot?["_content"] as? String
    }
}
