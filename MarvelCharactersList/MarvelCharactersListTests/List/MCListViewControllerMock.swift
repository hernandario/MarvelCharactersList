//
//  MCListViewControllerMock.swift
//  MarvelCharactersListTests
//
//  Created by Hernán Villamil on 16/11/20.
//

import XCTest
@ testable import MarvelCharactersList

class MCListViewControllerMock: MCListViewProtocol {
    var showSpinnerCalled = false
    var removeSpinnerCalled = false
    var fetchDidSuccesCalled = false
    var fetchDidFailCalled = false
    
    func showSpinner() {
        showSpinnerCalled = true
    }
    
    func removeSpinner() {
        removeSpinnerCalled = true
    }
    
    func fetchDidSucces(newItems: [MCListCharacter]) {
        fetchDidSuccesCalled = true
    }
    
    func fetchDidFail() {
        fetchDidFailCalled = true
    }
    


}
