//
//  ImageInfoReceiverMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageInfoReceiverMock: ImageInfoReceiver {
    var callsToReceiveImageInfo = 0

    var callsToHandleErrorGettingImageInfo = 0

    func receiveImageInfo(_ info: ImageInfo) {
        self.callsToReceiveImageInfo += 1
    }

    func handleErrorGettingImageInfo() {
        self.callsToHandleErrorGettingImageInfo += 1
    }
}
