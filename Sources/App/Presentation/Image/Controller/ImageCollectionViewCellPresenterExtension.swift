//
//  ImageCollectionViewCellPresenterExtension.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

extension ImageCollectionViewCell: ImageCell {
    func presentImage(_ imageUrls: ImageUrls) {
        self.updateImage(imageUrls)
    }

    func presentPlaceholderImage() {
    }
}
