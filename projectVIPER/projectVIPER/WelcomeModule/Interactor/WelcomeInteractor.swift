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
    var temperature: Int { get }
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    
    weak var presenter: WelcomePresenterProtocol?
    let dataService = DateService()
    let weatherService = WeatherService()
    
    var temperature = 0
    
    func loadDate() {
	   dataService.getDate { [weak self] date in
		  self?.presenter?.didLoad(date: date.description)
	   }
    }
    
    func loadWeather() {
	   weatherService.getWeather { [weak self] weather in
		  self?.presenter?.didLoad(weather: weather )
		  self?.temperature = weather
	   }
    }
    
}
