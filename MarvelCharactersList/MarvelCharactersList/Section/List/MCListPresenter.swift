//
//  MCListPresenter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListPresenterProtol: class {
    func viewDidLoad()
    func fetchDidSucces()
    func fetchDidFail()
}

class MCListPresenter {
    let view: MCListViewProtocol
    let interactor: MCListInteractorProtocol
    let router: MCListRouterProtocl
    
    init(view: MCListViewProtocol, interactor: MCListInteractorProtocol, router: MCListRouterProtocl) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MCListPresenter: MCListPresenterProtol {
    func viewDidLoad() {
        view.showSpinner()
        interactor.fetchCharactersList()
    }
    
    func fetchDidSucces() {
        view.removeSpinner()
        debugPrint("succes!")
    }
    
    func fetchDidFail() {
        view.removeSpinner()
        debugPrint("fail!")
    }
}
