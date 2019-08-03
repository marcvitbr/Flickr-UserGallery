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

    private let findUserExecutor: FindUserByUsernameExecutor

    init(screen: GalleryScreen,
         fetchExecutor: FetchPublicImagesExecutor,
         findUserExecutor: FindUserByUsernameExecutor) {
        self.screen = screen
        self.fetchExecutor = fetchExecutor
        self.findUserExecutor = findUserExecutor
    }

    func findUser(_ username: String) {
        self.screen.clearResultsView()

        guard let user = try? self.findUserExecutor.executeFindUserByUsername(username) else {
            self.screen.presentErrorWhenFindingUser()
            return
        }

        self.screen.prepareScreenForFetchImages(of: user)
    }

    func fetchImages(with query: Query) {
        self.screen.clearResultsView()

        guard let images = try? self.fetchExecutor.executeFetchPublicImages(with: query) else {
            self.screen.presentErrorWhenFetchingImages()
            return
        }

        self.screen.presentImages(images)
    }
}
