//
//  PublicImagesFetcherMockForFailure.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class PublicImagesFetcherMockForFailure: PublicImagesFetcherMock {
    override func fetchImages(query: Query) throws -> [ImageSummary] {
        _ = try super.fetchImages(query: query)

        throw PublicImagesFetcherError.errorFetchingImages
    }
}
