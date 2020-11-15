//
//  MCListPresenter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListPresenterProtol: class {
    func viewDidLoad()
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
        debugPrint("view did load")
    }
}
