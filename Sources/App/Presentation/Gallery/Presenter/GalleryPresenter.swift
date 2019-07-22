//
//  GalleryPresenter.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class GalleryPresenter {
    private let screen: GalleryScreen

    private let fetchExecutor: FetchPublicImagesExecutor

    init(screen: GalleryScreen, fetchExecutor: FetchPublicImagesExecutor) {
        self.screen = screen
        self.fetchExecutor = fetchExecutor
    }

    func searchImages(with query: Query) {
        self.screen.clearResultsView()

        guard let images = try? self.fetchExecutor.executeFetchPublicImages(with: query) else {
            self.screen.presentErrorWhenFetchingImages()
            return
        }

        self.screen.presentImages(images)
    }
}
