//
//  ImageDetailsFetcherMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageDetailsFetcherMockForFailure: ImageDetailsFetcherMock {
    override func obtainImageDetails(photoId: String) throws -> ImageDetails {
        _ = try super.obtainImageDetails(photoId: photoId)

        throw ImageDetailsFetcherError.errorObtainingImageDetails
    }
}
