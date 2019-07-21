//
//  DefaultGetImageUrlsExecutor.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultGetImageUrlsExecutor: GetImageUrlsExecutor, ImageUrlsReceiver, DependencyReceiver {
    private var semaphore: DispatchSemaphore!

    private var retrievedUrls: ImageUrls?

    private var isSuccess = false

    func executeGetImageUrls(for photoId: String) throws -> ImageUrls {
        guard let defaultFetcher = self.instance(of: ImageUrlsFetcher.self) else {
            throw GetImageUrlsExecutorError.errorExecutingGetImageUrls
        }

        self.resetExecutionFlags()

        let getImageUrls = GetImageUrls(fetcher: defaultFetcher,
                                        receiver: self)

        getImageUrls.execute(with: photoId)

        self.semaphore.wait()

        guard self.isSuccess, let info = self.retrievedUrls else {
            throw GetImageUrlsExecutorError.errorExecutingGetImageUrls
        }

        return info
    }

    func receiveImageUrls(_ details: ImageUrls) {
        self.retrievedUrls = details
        self.resumeExecution(success: true)
    }

    func handleErrorGettingImageUrls() {
        self.retrievedUrls = nil
        self.resumeExecution(success: false)
    }

    private func resetExecutionFlags() {
        self.isSuccess = false
        self.semaphore = DispatchSemaphore(value: 0)
    }

    private func resumeExecution(success: Bool) {
        self.isSuccess = success
        self.semaphore.signal()
    }
}
