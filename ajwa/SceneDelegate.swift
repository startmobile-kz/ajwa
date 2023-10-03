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
        let navigationController = UINavigationController(rootViewController: UIViewController())
        setupNavBar(navigationController)
        let namazController = SettingsViewController()
        namazController.view.backgroundColor = .white
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            navigationController.pushViewController(namazController, animated: true)
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func setupNavBar(_ navigationController: UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = AppColor.white.uiColor
        appearance.shadowColor = .clear
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }

}

