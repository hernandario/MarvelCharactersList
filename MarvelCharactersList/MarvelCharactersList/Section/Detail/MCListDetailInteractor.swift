//
//  MCListDetailInteractor.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListDetailInteractorProtocol: class {
    func fetchCharacter(with id: Int)
}

class MCListDetailInteractor {
    private var repository: MCListrepositoryProtocol
    var presenter: MCListDetailPresenterProtol?
    
    init(repository: MCListrepositoryProtocol) {
        self.repository = repository
    }
}

extension MCListDetailInteractor: MCListDetailInteractorProtocol {
    func fetchCharacter(with id: Int) {
        repository.fetchCharacter(id: id) {  [weak self] (result) in
            switch result {
            case .success(let charactersList):
                guard let character = charactersList.first else {
                    self?.presenter?.fetchDidFail()
                    return
                }
                self?.presenter?.fetchDidSucces(character: character)
            case .failure:
                self?.presenter?.fetchDidFail()
            }
        }
    }
}
