//
//  ImageInfoFetcherMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageInfoFetcherMockForFailure: ImageInfoFetcherMock {
    override func getImageInfo(photoId: String) throws -> ImageInfo {
        _ = try super.getImageInfo(photoId: photoId)

        throw ImageInfoFetcherError.errorGettingImageInfo
    }
}
