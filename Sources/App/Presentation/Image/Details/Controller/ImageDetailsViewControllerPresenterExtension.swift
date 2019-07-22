//
//  ImageDetailsViewControllerPresenterExtension.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

extension ImageDetailsViewController: ImageDetailsScreen {
    func clearTexts() {
        DispatchQueue.main.async { [weak self] in
            [self?.titleLabel,
             self?.descriptionLabel,
             self?.dateTakenLabel,
             self?.viewCountLabel,
             self?.commentCountLabel].forEach { $0?.text = nil }
        }
    }

    func presentDetails(_ details: ImageInfo) {
        DispatchQueue.main.async { [weak self] in
            guard let certainSelf = self else {
                return
            }

            certainSelf.fillImageFields(details)
        }
    }

    func presentFetchingDetailsErrorMessage() {
        DispatchQueue.main.async { [weak self] in
            guard let certainSelf = self else {
                return
            }

            let errorMessage = "Something went wrong when fetching image details. Please try again."
            let alert = Alerts.genericAlert(message: errorMessage)
            certainSelf.present(alert, animated: true, completion: nil)
        }
    }

    private func fillImageFields(_ info: ImageInfo) {
        self.titleLabel.text = info.title
        self.descriptionLabel.text = info.description
        self.fillDateTaken(info.dateTaken)
        self.viewCountLabel.text = info.viewCount ?? "-"
        self.commentCountLabel.text = info.commentCount ?? "-"
    }

    private func fillDateTaken(_ date: Date?) {
        guard let value = date else {
            self.dateTakenLabel.text = "-"
            return
        }

        self.dateTakenLabel.text = value.description
    }
}
