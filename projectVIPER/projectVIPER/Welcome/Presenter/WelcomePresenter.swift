//
//  WelcomePresenter.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol
    
    init(router: WelcomeRouterProtocol, interactor: WelcomeInteractorProtocol) {
	   self.router = router
	   self.interactor = interactor
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    
}
