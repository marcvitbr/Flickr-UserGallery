//
//  ImageCellPresenter.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ImageCellPresenter {
    private let cell: ImageCell

    private let getUrlsExecutor: GetImageUrlsExecutor

    init(cell: ImageCell, getUrlsExecutor: GetImageUrlsExecutor) {
        self.cell = cell
        self.getUrlsExecutor = getUrlsExecutor
    }

    func getImageUrls(of photoId: String) {
        guard let details = try? self.getUrlsExecutor.executeGetImageUrls(for: photoId) else {
            self.cell.presentPlaceholderImage()
            return
        }

        self.cell.presentImage(details)
    }
}
