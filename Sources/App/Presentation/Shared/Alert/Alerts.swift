//
//  Alerts.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

final class Alerts {
    static func genericAlert(message: String) -> UIAlertController {
        return UIAlertController(title: "Oops!",
                                 message: message,
                                 preferredStyle: .alert)
    }
}
