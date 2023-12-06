//
//  SceneDelegate.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
	    guard let windowScene = (scene as? UIWindowScene) else { return }
	    let window = UIWindow(windowScene: windowScene)
	    let vc = WelcomeModuleBuilder.build()
	    window.rootViewController = vc
	    self.window = window
	    self.window?.makeKeyAndVisible()

	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	    removeBlurEffect()
	}

	func sceneWillResignActive(_ scene: UIScene) {
	    addBlurEffect()
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
    
    //MARK: - privite methods
    
    private func addBlurEffect() {
	 
	   let blurEffect = UIBlurEffect(style: .extraLight)
	   let blurEffectView = UIVisualEffectView(effect: blurEffect)

	   blurEffectView.frame = window?.bounds ?? CGRect.zero
	   blurEffectView.tag = 1234
	   
	   window?.addSubview(blurEffectView)
    }
    
    private func removeBlurEffect() {
	   window?.subviews.forEach { subview in
		  if subview.tag == 1234 {
			 subview.removeFromSuperview()
		  }
	   }
    }
}

