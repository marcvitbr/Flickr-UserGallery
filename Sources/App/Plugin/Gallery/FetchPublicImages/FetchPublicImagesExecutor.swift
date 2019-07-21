//
//  FetchPublicImagesExecutor.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol FetchPublicImagesExecutor {
    func executeFetchPublicImages(with query: Query) throws -> [ImageSummary]
}
