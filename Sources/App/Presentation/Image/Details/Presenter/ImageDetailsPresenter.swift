//
//  ImageDetailsPresenter.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class ImageDetailsPresenter {
    private let screen: ImageDetailsScreen

    private let getInfoExecutor: GetImageInfoExecutor

    init(screen: ImageDetailsScreen, getInfoExecutor: GetImageInfoExecutor) {
        self.screen = screen
        self.getInfoExecutor = getInfoExecutor
    }

    func getImageInfo(of photoId: String) {
        self.screen.clearTexts()

        guard let details = try? self.getInfoExecutor.executeGetImageInfo(for: photoId) else {
            self.screen.presentFetchingDetailsErrorMessage()
            return
        }

        self.screen.presentDetails(details)
    }
}
