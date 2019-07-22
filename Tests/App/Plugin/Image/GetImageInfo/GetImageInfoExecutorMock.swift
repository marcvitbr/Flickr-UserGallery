//
//  GetImageInfoExecutorMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

class GetImageInfoExecutorMock: GetImageInfoExecutor {
    var callsToExecuteGetImageInfo = 0

    func executeGetImageInfo(for photoId: String) throws -> ImageInfo {
        self.callsToExecuteGetImageInfo += 1
        return ImageInfoFixture.validImageInfo
    }
}
