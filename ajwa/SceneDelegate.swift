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
        let KuranViewController = KuranViewController()
        KuranConfigurator.shared.configure(
            viewController: KuranViewController
        )
        
        let navigationController = UINavigationController(rootViewController: KuranViewController)
        setupNavBar(navigationController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func setupNavBar(_ navigationController: UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = AppColor.white.uiColor
        appearance.shadowColor = .clear
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }

}

