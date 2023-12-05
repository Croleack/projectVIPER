//
//  ImageModulePresenter.swift
//
//
//  Created by Enzhe Gaysina on 04.12.2023
//
import UIKit

protocol ImageModulePresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class ImageModulePresenter {
    weak var view: ImageModuleViewProtocol?
    var router: ImageModuleRouterProtocol
    var interactor: ImageModuleInteractorProtocol

    init(interactor: ImageModuleInteractorProtocol, router: ImageModuleRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ImageModulePresenter: ImageModulePresenterProtocol {
    
    func viewDidLoaded() {
	   let image = interactor.getImageForCurrentTemperature()
	   view?.showImage(image: image)
    }
    
}
