//
//  MCListInteractorMock.swift
//  MarvelCharactersListTests
//
//  Created by Hernán Villamil on 16/11/20.
//

import Foundation
@ testable import MarvelCharactersList

class MCListInteractorMock: MCListInteractorProtocol {
    var fetchCharactersListCalled = false
    
    func fetchCharactersList(offset: Int, responseLimit: Int) {
        fetchCharactersListCalled = true
    }
}
