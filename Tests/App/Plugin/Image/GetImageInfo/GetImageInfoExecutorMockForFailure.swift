//
//  GetImageInfoExecutorMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class GetImageInfoExecutorMockForFailure: GetImageInfoExecutorMock {
    override func executeGetImageInfo(for photoId: String) throws -> ImageInfo {
        _ = try? super.executeGetImageInfo(for: photoId)
        throw GetImageInfoExecutorError.errorExecutingGetImageInfo
    }
}
