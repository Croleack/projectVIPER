//
//  WelcomeRouter.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperature: Double)
}

class WelcomeRouter: WelcomeRouterProtocol {
    
    weak var viewController: ViewController?
    
    func openImage(for temperature: Double) {
	   let vc = ImageModuleModuleBuilder.build(temperature: temperature)
	   viewController?.present(vc, animated: true)
    }
}
