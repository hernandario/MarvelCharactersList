//
//  MCListDetailPresenter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListDetailPresenterProtol: AnyObject {
    func viewDidLoad(with character: MCListCharacter)
    func fetchDidSucces(character: MCListCharacter)
    func fetchDidFail()
}

class MCListDetailPresenter {
    let view: MCListDetailProtocol
    let interactor: MCListDetailInteractorProtocol
    
    init(view: MCListDetailProtocol, interactor: MCListDetailInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension MCListDetailPresenter: MCListDetailPresenterProtol {
    func viewDidLoad(with character: MCListCharacter) {
        view.showSpinner()
        interactor.fetchCharacter(with: character.id)
    }
    
    func fetchDidSucces(character: MCListCharacter) {
        view.removeSpinner()
        view.fetchDidSucces(character: character)
    }
    
    func fetchDidFail() {
        view.removeSpinner()
        view.fetchDidFail()
    }
}
