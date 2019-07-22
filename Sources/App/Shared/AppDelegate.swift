//
//  AppDelegate.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let dependencyConfigurator = DependencyConfigurator()
        dependencyConfigurator.configureDependencies()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        self.coverScreen()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        self.uncoverScreen()
    }

    private func coverScreen() {
        guard let viewController = self.visibleViewController else {
            return
        }

        let blurEffect = UIBlurEffect(style: .regular)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = viewController.view.bounds
        viewController.view.addSubview(blurredEffectView)
    }

    private func uncoverScreen() {
        guard let viewController = self.visibleViewController,
            let blurredEffectView = viewController.view.subviews.last as? UIVisualEffectView else {
            return
        }

        blurredEffectView.removeFromSuperview()
    }

    var visibleViewController: UIViewController? {
        var current = UIApplication.shared.keyWindow?.rootViewController

        while let presented = current?.presentedViewController {
            current = presented
        }

        return current
    }
}
