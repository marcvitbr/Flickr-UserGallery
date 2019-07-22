//
//  ImageInfo.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

class ImageInfo {
    let photoId: String
    let title: String
    let description: String
    let dateTaken: Date?
    let viewCount: String?
    let commentCount: String?

    init(photoId: String,
         title: String,
         description: String,
         dateTaken: Date?,
         viewCount: String?,
         commentCount: String?) {
        self.photoId = photoId
        self.title = title
        self.description = description
        self.dateTaken = dateTaken
        self.viewCount = viewCount
        self.commentCount = commentCount
    }
}
