//
//  ImageUrls.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageUrls {
    let photoId: String

    let largeSquareUrlPath: String

    let largeUrlPath: String

    init(photoId: String, largeSquareUrlPath: String, largeUrlPath: String) {
        self.photoId = photoId
        self.largeSquareUrlPath = largeSquareUrlPath
        self.largeUrlPath = largeUrlPath
    }
}
