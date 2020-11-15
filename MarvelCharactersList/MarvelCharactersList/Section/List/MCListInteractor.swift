//
//  MCListInteractor.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListInteractorProtocol {
    func fetchCharactersList()
}

class MCListInteractor {
    private var repository: MCListrepositoryProtocol
    var presenter: MCListPresenterProtol?
    
    init(repository: MCListrepositoryProtocol) {
        self.repository = repository
    }

}

extension  MCListInteractor: MCListInteractorProtocol {
    func fetchCharactersList() {
        //TODO: fetch list
    }
}
