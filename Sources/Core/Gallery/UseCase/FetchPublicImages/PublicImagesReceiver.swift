//
//  PublicImagesReceiver.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol PublicImagesReceiver: AnyObject {
    func receiveImageSummaries(_ images: [ImageSummary])

    func handleErrorFetchingImageSummaries()
}
