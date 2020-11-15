//
//  MCListPresenter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListPresenterProtol: class {
    func fetchCharacters(offset: Int, responseLimit: Int)
    func fetchDidSucces(items: [MCListCharacter])
    func fetchDidFail()
    func didSelectCharacter(_ character: MCListCharacter)
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
    func fetchCharacters(offset: Int, responseLimit: Int) {
        view.showSpinner()
        interactor.fetchCharactersList(offset: offset, responseLimit: responseLimit)
    }
    
    func fetchDidSucces(items: [MCListCharacter]) {
        view.removeSpinner()
        view.fetchDidSucces(newItems: items)
    }
    
    func fetchDidFail() {
        view.removeSpinner()
        view.fetchDidFail()
    }
    
    func didSelectCharacter(_ character: MCListCharacter) {
        debugPrint("fcharacter selected: \(character.name)")
    }
}
