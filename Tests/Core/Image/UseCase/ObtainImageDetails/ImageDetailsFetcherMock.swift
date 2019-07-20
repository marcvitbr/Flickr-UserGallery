//
//  ImageDetailsFetcherMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class ImageDetailsFetcherMock: ImageDetailsFetcher {
    var callsToObtainImageDetails = 0

    func obtainImageDetails(photoId: String) throws -> ImageDetails {
        self.callsToObtainImageDetails += 1
        return ImageDetailsFixture.validImageDetails
    }
}
