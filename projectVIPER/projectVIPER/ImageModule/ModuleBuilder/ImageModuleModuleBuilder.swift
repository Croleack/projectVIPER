//
//  ImageModuleModuleBuilder.swift
//
//
//  Created by Enzhe Gaysina on 04.12.2023
//

import UIKit

class ImageModuleModuleBuilder {
    static func build(temperature: Double) -> ImageModuleViewController {
	   let interactor = ImageModuleInteractor(temperature: temperature )
        let router = ImageModuleRouter()
        let presenter = ImageModulePresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "ImageModule", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ImageModule") as! ImageModuleViewController
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
