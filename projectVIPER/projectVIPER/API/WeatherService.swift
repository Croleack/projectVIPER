//
//  WeatherService.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

class WeatherService {
    func getWeather(completion: @escaping (Int) -> Void) {
	   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
		  let temperature = Int.random(in: -30...30)
		  completion(temperature)
	   }
    }
}
