//
//  DefaultGetImageInfoExecutor.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultGetImageInfoExecutor: GetImageInfoExecutor, ImageInfoReceiver, DependencyReceiver {
    private var semaphore: DispatchSemaphore!

    private var retrievedInfo: ImageInfo?

    private var isSuccess = false

    func executeGetImageInfo(for photoId: String) throws -> ImageInfo {
        guard let defaultFetcher = self.instance(of: ImageInfoFetcher.self) else {
            throw GetImageInfoExecutorError.errorExecutingGetImageInfo
        }

        self.resetExecutionFlags()

        let getImageInfo = GetImageInfo(fetcher: defaultFetcher,
                                        receiver: self)

        getImageInfo.execute(with: photoId)

        self.semaphore.wait()

        guard self.isSuccess, let info = self.retrievedInfo else {
            throw GetImageInfoExecutorError.errorExecutingGetImageInfo
        }

        return info
    }

    func receiveImageInfo(_ details: ImageInfo) {
        self.retrievedInfo = details
        self.resumeExecution(success: true)
    }

    func handleErrorGettingImageInfo() {
        self.retrievedInfo = nil
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
