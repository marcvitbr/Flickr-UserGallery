//
//  StringLocalizationExtension.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 02/08/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
