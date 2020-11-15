//
//  MCListRouter.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation

protocol MCListRouterProtocl: class {
    func goToCharacterDetail(with charId: String)
}

class MCListRouter {
    let controller: MCListViewController
    
    init(with controller: MCListViewController) {
        self.controller = controller
    }
}

extension MCListRouter: MCListRouterProtocl {
    func goToCharacterDetail(with charId: String) {
        //TODO: go to char detail
    }
}
