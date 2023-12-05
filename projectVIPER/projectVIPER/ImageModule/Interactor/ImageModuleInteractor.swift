//
//  ImageModuleInteractor.swift
//
//
//  Created by Enzhe Gaysina on 04.12.2023
//

import UIKit

protocol ImageModuleInteractorProtocol: AnyObject {
    func getImageForCurrentTemperature() -> UIImage? 
}

class ImageModuleInteractor: ImageModuleInteractorProtocol {

    weak var presenter: ImageModulePresenterProtocol?
	let temperature: Double
    
    init(temperature: Double) {
	   self.temperature = temperature
    }
    
    func getImageForCurrentTemperature() -> UIImage? {
	   if temperature < 0 {
		  return UIImage(systemName: "snowflake")
	   } else if temperature >= 0, temperature < 10 {
		  return UIImage(systemName: "cloud.fill")
	   } else {
		  return UIImage(systemName: "sun.min.fill")
	   }
    }
}
