//
//  ImageInfoReceiver.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol ImageInfoReceiver: AnyObject {
    func receiveImageInfo(_ info: ImageInfo)

    func handleErrorGettingImageInfo()
}
