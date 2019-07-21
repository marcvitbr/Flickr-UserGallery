//
//  PublicImagesReceiverMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class PublicImagesReceiverMock: PublicImagesReceiver {
    var callsToReceiveImages = 0

    var callsToHandleErrorFetchingImages = 0

    func receiveImageSummaries(_ images: [ImageSummary]) {
        self.callsToReceiveImages += 1
    }

    func handleErrorFetchingImageSummaries() {
        self.callsToHandleErrorFetchingImages += 1
    }
}
