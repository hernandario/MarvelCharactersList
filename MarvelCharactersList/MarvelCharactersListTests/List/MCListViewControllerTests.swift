//
//  MCListViewControllerTests.swift
//  MarvelCharactersListTests
//
//  Created by Hernán Villamil on 16/11/20.
//

import XCTest
@ testable import MarvelCharactersList

class MCListViewControllerTests: XCTestCase {
    var repository: MCListrepositoryMock!
    var view: MCListViewControllerMock!
    var interactor: MCListInteractorMock!
    var router: MCListRouterMock!
    var presenter: MCListViewPresenterMock!
    var character: MCListCharacter!

    override func setUp() {
        super.setUp()
        repository = MCListrepositoryMock()
        view = MCListViewControllerMock()
        interactor = MCListInteractorMock()
        router = MCListRouterMock()
        presenter = MCListViewPresenterMock()
        character = MCListCharacter(id: 0, name: "test", resultDescription: "", modified: "",
                                    resourceURI: "", urls: [],
                                    thumbnail: Thumbnail(path: "", thumbnailExtension: ""),
                                    comics: Comics(available: 0, returned: 0, collectionURI: "", items: []),
                                    stories: Stories(available: 0, returned: 0, collectionURI: "", items: []),
                                    events: Comics(available: 0, returned: 0, collectionURI: "", items: []),
                                    series: Comics(available: 0, returned: 0, collectionURI: "", items: []))
    }
    
    override func tearDown() {
        repository = nil
        view = nil
        interactor = nil
        router = nil
        presenter = nil
        character = nil
        super.tearDown()
    }

    
    // MARK: - View
    func testShowSpinner() {
        view.showSpinner()
        XCTAssert(view.showSpinnerCalled)
    }
    
    func testRemoveSpinner() {
        view.removeSpinner()
        XCTAssert(view.removeSpinnerCalled)
    }
    
    func testFetchSucces() {
        view.fetchDidSucces(newItems: [])
        XCTAssert(view.fetchDidSuccesCalled)
    }
    
    func testFetchFail() {
        view.fetchDidFail()
        XCTAssert(view.fetchDidFailCalled)
    }
    
    // MARK: - Interactor/Repository
    func testFetchCharactersList() {
        interactor.fetchCharactersList(offset: 0, responseLimit: 20)
        XCTAssert(interactor.fetchCharactersListCalled)
    }
    
    func testFetchCharactersListRepository() {
        repository.fetchCharactersList(offset: 0, responseLimit: 20) {  (response) in
            XCTAssert(self.repository.fetchCharactersListCalled)
        }
    }
    
    // MARK: - Router
    func testGoToCharacterDetail() {
        router.goToCharacterDetail(with: character)
        XCTAssert(router.goToCharacterDetailCalled)
    }
    
    // MARK: - Presenter
    func testFetchCharacters() {
        presenter.fetchCharacters(offset: 0, responseLimit: 20)
        XCTAssert(presenter.fetchCharactersCalled)
    }
    
    func testFetchDidSucces() {
        presenter.fetchDidSucces(items: [])
        XCTAssert(presenter.fetchDidSuccesCalled)
    }
    
    func testFetchDidFail() {
        presenter.fetchDidFail()
        XCTAssert(presenter.fetchDidFailCalled)
    }
    
    func testDidSelectCharacter() {
        presenter.didSelectCharacter(character)
        XCTAssert(presenter.didSelectCharacterCalled)
    }
}
