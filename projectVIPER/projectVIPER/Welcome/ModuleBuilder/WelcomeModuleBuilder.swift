//
//  WelcomeModuleBuilder.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import UIKit

class WelcomeModuleBuilder {
    static func build() -> ViewController {
	   let interactor = WelcomeInteractor()
	   let router = WelcomeRouter()
	   let presenter = WelcomePresenter(router: router,
								 interactor: interactor)
	   let storyboard = UIStoryboard(name: "Main", bundle: nil)
	   let viewController = storyboard.instantiateViewController(identifier: "Main") as ViewController
	   viewController.presenter = presenter
	   presenter.view = viewController
	   interactor.presenter = presenter
	   router.presenter = presenter
	   return viewController
    }
}
