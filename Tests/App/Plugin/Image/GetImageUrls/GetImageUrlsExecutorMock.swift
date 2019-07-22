//
//  GetImageUrlsExecutorMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class GetImageUrlsExecutorMock: GetImageUrlsExecutor {
    var callsToExecuteGetImageUrls = 0

    func executeGetImageUrls(for photoId: String) throws -> ImageUrls {
        self.callsToExecuteGetImageUrls += 1
        return ImageUrlsFixture.validImageUrls
    }
}
