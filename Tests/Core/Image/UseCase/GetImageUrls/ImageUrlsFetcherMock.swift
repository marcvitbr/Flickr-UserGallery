//
//  ImageUrlsFetcherMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class ImageUrlsFetcherMock: ImageUrlsFetcher {
    var callsToObtainImageDetails = 0

    func getImageUrls(photoId: String) throws -> ImageUrls {
        self.callsToObtainImageDetails += 1
        return ImageDetailsFixture.validImageDetails
    }
}
