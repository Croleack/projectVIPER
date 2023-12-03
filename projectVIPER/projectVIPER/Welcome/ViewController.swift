//
//  ViewController.swift
//  projectVIPER
//
//  Created by Enzhe Gaysina on 03.12.2023.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    
}

class ViewController: UIViewController {
    
    var presenter: WelcomePresenterProtocol?

	override func viewDidLoad() {
		super.viewDidLoad()
	    view.backgroundColor = .yellow
	}
}

extension ViewController: WelcomeViewProtocol {
    
}

