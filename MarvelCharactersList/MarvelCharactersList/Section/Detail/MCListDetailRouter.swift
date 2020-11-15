//
//  MCListDetailRouter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import UIKit

protocol MCListDetailRouterProtocol {
    static func createModule(with character: MCListCharacter) -> MCListDetailViewController?
}

class MCListDetailRouter: MCListDetailRouterProtocol {
    static func createModule(with character: MCListCharacter) -> MCListDetailViewController? {
        let identifier = "MCListDetailViewController"
        let storyBoard = UIStoryboard(name: identifier, bundle: .main)
        guard let controller = storyBoard.instantiateViewController(identifier: identifier) as? MCListDetailViewController else { return nil }
       
        let interactor = MCListDetailInteractor(repository: MCListrepository())
        let presenter = MCListDetailPresenter(view: controller, interactor: interactor)
        
        interactor.presenter = presenter
        controller.presenter = presenter
        controller.character = character
        return controller
    }
}
