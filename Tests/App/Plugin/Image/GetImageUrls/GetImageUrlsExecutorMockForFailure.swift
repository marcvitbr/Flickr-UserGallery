//
//  GetImageUrlsExecutorMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class GetImageUrlsExecutorMockForFailure: GetImageUrlsExecutorMock {
    override func executeGetImageUrls(for photoId: String) throws -> ImageUrls {
        _ = try super.executeGetImageUrls(for: photoId)
        throw GetImageUrlsExecutorError.errorExecutingGetImageUrls
    }
}
