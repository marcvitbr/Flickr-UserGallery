//
//  ImageDetailsViewController.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import UIKit

final class ImageDetailsViewController: UIViewController, DependencyReceiver {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateTakenLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!

    private var photoId: String?
    private var imageUrlPath: String?

    private var infoFetcher: ImageInfoFetcher!
    private var getInfoExecutor: GetImageInfoExecutor!
    private var presenter: ImageDetailsPresenter!

    static func new(photoId: String, imageUrlPath: String) -> ImageDetailsViewController? {
        let storyboard = UIStoryboard(name: "ImageDetails", bundle: nil)
        let detailsViewController = storyboard.instantiateInitialViewController() as? ImageDetailsViewController
        detailsViewController?.photoId = photoId
        detailsViewController?.imageUrlPath = imageUrlPath
        return detailsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurePresenter()

        self.presentMainImage()

        self.fetchImageDetails()
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    private func configurePresenter() {
        self.infoFetcher = self.instance(of: ImageInfoFetcher.self)
        self.getInfoExecutor = self.instance(of: GetImageInfoExecutor.self)
        self.presenter = ImageDetailsPresenter(screen: self,
                                               getInfoExecutor: self.getInfoExecutor)
    }

    private func presentMainImage() {
        guard let urlPath = self.imageUrlPath,
            let url = URL(string: urlPath) else {
                return
        }

        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: url)
    }

    private func fetchImageDetails() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let photoId = self?.photoId else {
                return
            }

            self?.presenter.getImageInfo(of: photoId)
        }
    }
}
