//
//  SceneDelegate.swift
//  Truco-Juego
//
//  Created by Nicolas Famularo on 08/01/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//MARK: Modification for no storyboard
        guard let windowScene = (scene as? UIWindowScene) else { return } // change _ -> "windowScene"
        
//MARK: Added for no storyboard
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        
//END MARK
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    
    
}
