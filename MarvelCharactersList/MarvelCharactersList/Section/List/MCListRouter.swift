//
//  MCListRouter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListRouterProtocl: class {
    func goToCharacterDetail(with character: MCListCharacter)
}

class MCListRouter {
    let controller: MCListViewController
    
    init(with controller: MCListViewController) {
        self.controller = controller
    }
}

extension MCListRouter: MCListRouterProtocl {
    func goToCharacterDetail(with character: MCListCharacter) {
        guard let detailController = MCListDetailRouter.createModule(with: character) else { return }
        controller.navigationController?.pushViewController(detailController, animated: true)
    }
}
