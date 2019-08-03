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
        let alert = UIAlertController(title: "AlertGenericTitle".localized(),
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))

        return alert
    }
}
