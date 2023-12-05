//
//  ImageModuleViewController.swift
//
//
//  Created by Enzhe Gaysina on 04.12.2023
//

import UIKit

protocol ImageModuleViewProtocol: AnyObject {
    func showImage(image: UIImage? )
}

class ImageModuleViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    // MARK: - Public
    var presenter: ImageModulePresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
	   presenter?.viewDidLoaded()
        initialize()
    }
}

// MARK: - Private functions
private extension ImageModuleViewController {
    func initialize() {
    }
}

// MARK: - ImageModuleViewProtocol
extension ImageModuleViewController: ImageModuleViewProtocol {
    func showImage(image: UIImage?) {
	   DispatchQueue.main.async {
		  self.imageView.image = image
	   }
    }
    
}
