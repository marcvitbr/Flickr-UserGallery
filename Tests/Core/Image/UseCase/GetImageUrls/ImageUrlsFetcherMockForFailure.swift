//
//  ImageUrlsFetcherMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageUrlsFetcherMockForFailure: ImageUrlsFetcherMock {
    override func getImageUrls(photoId: String) throws -> ImageUrls {
        _ = try super.getImageUrls(photoId: photoId)

        throw ImageUrlsFetcherError.errorGettingImageUrls
    }
}
