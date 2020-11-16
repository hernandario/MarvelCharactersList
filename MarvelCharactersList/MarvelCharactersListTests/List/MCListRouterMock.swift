//
//  MCListRouterMock.swift
//  MarvelCharactersListTests
//
//  Created by Hernán Villamil on 16/11/20.
//

import Foundation
@ testable import MarvelCharactersList

class MCListRouterMock: MCListRouterProtcol {
    var goToCharacterDetailCalled = false
    
    func goToCharacterDetail(with character: MCListCharacter) {
        goToCharacterDetailCalled = true
    }
    
}
