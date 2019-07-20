//
//  ObtainImageDetails.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class ObtainImageDetails: ParameterizedUseCase {
    typealias Parameter = String

    private weak var fetcher: ImageDetailsFetcher?

    private weak var receiver: ImageDetailsReceiver?

    init(fetcher: ImageDetailsFetcher, receiver: ImageDetailsReceiver) {
        self.fetcher = fetcher
        self.receiver = receiver
    }

    func execute(with parameters: String) {
        guard let details = try? self.fetcher?.obtainImageDetails(photoId: parameters) else {
            self.receiver?.handleErrorObtainingImageDetails()
            return
        }

        self.receiver?.receiveImageDetails(details)
    }
}
