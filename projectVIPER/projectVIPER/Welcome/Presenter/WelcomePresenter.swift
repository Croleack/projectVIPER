//
//  WelcomePresenter.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(date: String?)
    func didLoad(weather: Int? )
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
    func didLoad(date: String?) {
	   view?.showDate(date: date ?? "No date")
    }
    
    func didLoad(weather: Int?) {
	   let temperature = weather?.description ?? "no temperature"
	   view?.showWeather(weather: temperature)
    }
    
    func viewDidLoaded() {
	   interactor.loadDate()
	   interactor.loadWeather()
    }
}
