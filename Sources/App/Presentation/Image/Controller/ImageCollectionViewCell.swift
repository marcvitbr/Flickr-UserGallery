//
//  ImageCollectionViewCell.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell, DependencyReceiver {
    static let cellIdentifier = "ImageCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!

    private var getUrlsExecutor: GetImageUrlsExecutor!

    private var presenter: ImageCellPresenter!

    private var photoId: String?

    private weak var imageUrls: ImageUrls?

    override func awakeFromNib() {
        super.awakeFromNib()

        self.getUrlsExecutor = self.instance(of: GetImageUrlsExecutor.self)

        self.presenter = ImageCellPresenter(cell: self,
                                            getUrlsExecutor: self.getUrlsExecutor)
    }

    func updateSummary(_ imageSummary: ImageSummary) {
        self.photoId = imageSummary.photoId

        self.imageTitleLabel.text = imageSummary.title
    }

    func startFetchingUrls() {
        guard let photoId = self.photoId else {
            return
        }

        self.imageView.image = nil

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.presenter.getImageUrls(of: photoId)
        }
    }

    func openImage(on viewController: UIViewController) {
//        guard let imageDetails = self.imageDetails else {
//            return
//        }
//
//        guard let fullScreen = FullScreenImageViewController.new(with: imageDetails.largeUrlPath) else {
//            return
//        }
//
//        viewController.present(fullScreen, animated: true, completion: nil)
    }

    internal func updateImage(_ imageUrls: ImageUrls) {
        DispatchQueue.main.async { [weak self] in
            self?.imageUrls = imageUrls

            guard let url = URL(string: imageUrls.largeSquareUrlPath) else {
                return
            }

            self?.imageView.kf.setImage(with: url)
        }
    }
}
