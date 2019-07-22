//
//  ImageDetailsScreen.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol ImageDetailsScreen {
    func clearTexts()

    func presentDetails(_ details: ImageInfo)

    func presentFetchingDetailsErrorMessage()
}
