//
//  DateService.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import Foundation

class DateService {
    func getDate(completion: @escaping (Date) -> Void) {
	   DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
		  completion(Date())
	   }
    }
}
