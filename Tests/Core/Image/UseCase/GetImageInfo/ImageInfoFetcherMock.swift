//
//  ImageInfoFetcherMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class ImageInfoFetcherMock: ImageInfoFetcher {
    var callsToGetImageInfo = 0

    func getImageInfo(photoId: String) throws -> ImageInfo {
        self.callsToGetImageInfo += 1
        return ImageInfoFixture.validImageInfo
    }
}
