//
//  ImageCollectionLoadingFooterView.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

final class ImageCollectionLoadingFooterView: UICollectionReusableView {
    static let identifier = "ImageCollectionLoadingFooterView"

    static let size = CGSize(width: 30, height: 50)

    private lazy var indicator = UIActivityIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    func animate() {
        self.indicator.startAnimating()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.indicator.center = self.center
    }

    private func initialize() {
        self.indicator.style = .gray
        self.addSubview(self.indicator)
    }
}
