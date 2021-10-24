//
//  MCListInteractor.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListInteractorProtocol: AnyObject {
    func fetchCharactersList(offset: Int, responseLimit: Int)
}

class MCListInteractor {
    private var repository: MCListrepositoryProtocol
    weak var presenter: MCListPresenterProtol?
    
    init(repository: MCListrepositoryProtocol) {
        self.repository = repository
    }
    
}

extension MCListInteractor: MCListInteractorProtocol {
    func fetchCharactersList(offset: Int, responseLimit: Int) {
        repository.fetchCharactersList(offset: offset, responseLimit: responseLimit) { [weak self] (result) in
            switch result {
            case .success(let characterList):
                self?.presenter?.fetchDidSucces(items: characterList)
            case .failure:
                self?.presenter?.fetchDidFail()
            }
        }
    }
}
