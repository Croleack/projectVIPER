//
//  WeatherService.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

private extension String {
    static let baseURL = "https://api.openweathermap.org/data/2.5/forecast?lat=55.7558&lon=37.6176&units=metric&"
    static let apiKey = "appid=53ea9de349fd1cdfdb97aa10726c6a33"
}

private enum RequestType: String {
    case get
    case post
    case put
    case delete
    case patch
}

protocol IWeatherServiceProtocol {
    func getTemperature(completion: @escaping (Double?) -> Void)
}

final class WeatherService: IWeatherServiceProtocol {
    
    // MARK: - Public functions
    
    func getTemperature(completion: @escaping (Double?) -> Void) {
	   sendRequest(type: .get) { data in
		  do {
			 if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
				let temperature = self.parseTemperature(from: json)
				completion(temperature)
			 } else {
				print("Не удалось извлечь температуру")
				completion(nil)
			 }
		  } catch {
			 print("Ошибка при парсинге: \(error)")
			 completion(nil)
		  }
	   }
    }
    
    // MARK: - Private functions
    
    private func parseTemperature(from json: [String: Any]) -> Double? {
	   guard let list = json["list"] as? [[String: Any]],
		    let firstItem = list.first,
		    let main = firstItem["main"] as? [String: Any],
		    let temperature = main["temp"] as? Double else {
		  return nil
	   }
	   return temperature
    }
    
    private func sendRequest(type: RequestType, body: Data? = nil,
	   completionHandler: @escaping ((Data) -> Void)
    ) {
	   guard let url = URL(string: .baseURL + .apiKey) else { return }
	   
	   var request = URLRequest(url: url)
	   request.httpMethod = type.rawValue
	   request.httpBody = body
	   
	   let task = URLSession.shared.dataTask(with: request) { data, response, error in
		  guard error == nil,
			   let data else {
			 print(error?.localizedDescription)
			 return
		  }
		  completionHandler(data)
	   }
	   task.resume()
    }
}
