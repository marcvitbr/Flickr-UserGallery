//
//  FetchPublicImagesExecutorMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class FetchPublicImagesExecutorMockForFailure: FetchPublicImagesExecutorMock {
    override func executeFetchPublicImages(with query: Query) throws -> [ImageSummary] {
        _ = try super.executeFetchPublicImages(with: query)
        throw FetchPublicImagesExecutorError.errorExecutingFetchPublicImages
    }
}
