//
//  SceneDelegate.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: CatListViewController())
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

