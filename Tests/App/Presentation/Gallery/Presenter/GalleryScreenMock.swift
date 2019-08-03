//
//  GalleryScreenMock.swift
//  Flickr-UserGalleryTests
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class GalleryScreenMock: GalleryScreen {
    var callsToClearResultsView = 0

    var callsToPrepareScreenForFetchImages = 0

    var callsToPresentImages = 0

    var callsToPresentErrorWhenFetchingImages = 0

    var callsToPresentErrorWhenFindingUser = 0

    func clearResultsView() {
        self.callsToClearResultsView += 1
    }

    func prepareScreenForFetchImages(of user: User) {
        self.callsToPrepareScreenForFetchImages += 1
    }

    func presentImages(_ images: [ImageSummary]) {
        self.callsToPresentImages += 1
    }

    func presentErrorWhenFetchingImages() {
        self.callsToPresentErrorWhenFetchingImages += 1
    }

    func presentErrorWhenFindingUser() {
        self.callsToPresentErrorWhenFindingUser += 1
    }
}
