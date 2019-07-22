//
//  ImageDetailsScreenMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageDetailsScreenMock: ImageDetailsScreen {
    var callsToClearTexts = 0

    var callsToPresentDetails = 0

    var callsToPresentError = 0

    func clearTexts() {
        self.callsToClearTexts += 1
    }

    func presentDetails(_ details: ImageInfo) {
        self.callsToPresentDetails += 1
    }

    func presentFetchingDetailsErrorMessage() {
        self.callsToPresentError += 1
    }
}
