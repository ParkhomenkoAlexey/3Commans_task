//
//  SceneDelegate.swift
//  3Commans_task
//
//  Created by Алексей on 30.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let listVC = ListModuleModuleConfigurator().makeListModuleViewController()
        
        window?.rootViewController = listVC
        window?.makeKeyAndVisible()
    }
}
