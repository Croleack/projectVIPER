//
//  ViewController.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var presenter: WelcomePresenterProtocol?

	override func viewDidLoad() {
		super.viewDidLoad()
	    view.backgroundColor = .yellow
	    presenter?.viewDidLoaded()
	}
    
    @IBAction func didTapButton(_ sender: Any) {
	   presenter?.didTapImageButton()
    }
}

extension ViewController: WelcomeViewProtocol {
    
    func showDate(date: String) {
	   DispatchQueue.main.async {
		  self.dateLabel.text = date
	   }
    }
    
    func showWeather(weather: String) {
	   DispatchQueue.main.async {
		  self.weatherLabel.text = weather
	   }
    }
    
    
}

