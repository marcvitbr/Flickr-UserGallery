//
//  PublicImagesFetcherMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class PublicImagesFetcherMock: PublicImagesFetcher {
    var callsToFetchImages = 0

    func fetchImages(query: Query) throws -> [ImageSummary] {
        self.callsToFetchImages += 1
        return []
    }
}
