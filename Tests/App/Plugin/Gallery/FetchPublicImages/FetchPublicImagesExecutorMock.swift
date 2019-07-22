//
//  FetchPublicImagesExecutorMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class FetchPublicImagesExecutorMock: FetchPublicImagesExecutor {
    var callsToExecuteFetch = 0

    func executeFetchPublicImages(with query: Query) throws -> [ImageSummary] {
        self.callsToExecuteFetch += 1
        return []
    }
}
