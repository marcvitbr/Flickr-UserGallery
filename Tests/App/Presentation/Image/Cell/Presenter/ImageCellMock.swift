//
//  ImageCellMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageCellMock: ImageCell {
    var callsToPresentImage = 0

    var callsToPresentPlaceholderImage = 0

    func presentImage(_ imageUrls: ImageUrls) {
        self.callsToPresentImage += 1
    }

    func presentPlaceholderImage() {
        self.callsToPresentPlaceholderImage += 1
    }
}
