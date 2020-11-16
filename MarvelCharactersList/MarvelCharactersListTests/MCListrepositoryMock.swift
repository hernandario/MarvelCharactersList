//
//  MCListrepositoryMock.swift
//  MarvelCharactersListTests
//
//  Created by Hernán Villamil on 16/11/20.
//

import Foundation
@ testable import MarvelCharactersList

class MCListrepositoryMock: MCListrepositoryProtocol {
    var fetchCharactersListCalled = false
    var fetchCharacterCalled = false
    
    func fetchCharactersList(offset: Int, responseLimit: Int, completion: @escaping (Result<[MCListCharacter], Error>) -> Void) {
        fetchCharactersListCalled = true
        completion(.success([]))
    }
    
    func fetchCharacter(id: Int, completion: @escaping (Result<[MCListCharacter], Error>) -> Void) {
        fetchCharacterCalled = true
        completion(.success([]))
    }
    
}
