//
//  SceneDelegate.swift
//  ajwa
//
//  Created by Nurgul on 07.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let holidaysViewController = HolidaysViewController()
        HolidaysConfigurator.shared.configure(
            viewController: holidaysViewController
        )
        window?.rootViewController = holidaysViewController
        window?.makeKeyAndVisible()
    }

}

