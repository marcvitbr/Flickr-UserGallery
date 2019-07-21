//
//  ImageInfoFixture.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class ImageInfoFixture {
    static let validImageInfo = ImageInfo(photoId: "48318682806",
                                          title: "title",
                                          description: "description",
                                          dateTaken: Date(timeIntervalSinceNow: 0),
                                          viewCount: 0,
                                          commentCount: 0)
}
