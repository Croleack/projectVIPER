//
//  WelcomeInteractor.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadDate()
    func loadWeather() 
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    
    weak var presenter: WelcomePresenterProtocol?
    let dataService = DateService()
    let weatherService = WeatherService()
    
    func loadDate() {
	   dataService.getDate { [weak self] date in
		  self?.presenter?.didLoad(date: date.description)
	   }
    }
    
    func loadWeather() {
	   weatherService.getWeather { [weak self] weather in
		  self?.presenter?.didLoad(weather: weather )
	   }
    }
    
}
