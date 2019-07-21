//
//  ImageInfo.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

class ImageInfo {
    private let photoId: String
    private let title: String
    private let description: String
    private let dateTaken: Date
    private let viewCount: Int
    private let commentCount: Int

    init(photoId: String, title: String, description: String, dateTaken: Date, viewCount: Int, commentCount: Int) {
        self.photoId = photoId
        self.title = title
        self.description = description
        self.dateTaken = dateTaken
        self.viewCount = viewCount
        self.commentCount = commentCount
    }
}
