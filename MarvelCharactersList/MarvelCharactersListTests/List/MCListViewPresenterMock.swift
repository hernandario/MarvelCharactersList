//
//  MCListViewPresenterMock.swift
//  MarvelCharactersListTests
//
//  Created by Hernán Villamil on 16/11/20.
//

import XCTest
@ testable import MarvelCharactersList

class MCListViewPresenterMock: MCListPresenterProtol {
    
    var fetchCharactersCalled = false
    var fetchDidSuccesCalled = false
    var fetchDidFailCalled = false
    var didSelectCharacterCalled = false
    
    func fetchCharacters(offset: Int, responseLimit: Int) {
        fetchCharactersCalled = true
    }
    
    func fetchDidSucces(items: [MCListCharacter]) {
        fetchDidSuccesCalled = true
    }
    
    func fetchDidFail() {
        fetchDidFailCalled = true
    }
    
    func didSelectCharacter(_ character: MCListCharacter) {
        didSelectCharacterCalled = true
    }

}
