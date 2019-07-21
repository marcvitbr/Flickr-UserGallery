//
//  ImageDetailsReceiverMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageDetailsReceiverMock: ImageDetailsReceiver {
    var callsToReceiveImageDetails = 0

    var callsToHandleErrorObtainingImageDetails = 0

    func receiveImageDetails(_ details: ImageUrls) {
        self.callsToReceiveImageDetails += 1
    }

    func handleErrorObtainingImageDetails() {
        self.callsToHandleErrorObtainingImageDetails += 1
    }
}
