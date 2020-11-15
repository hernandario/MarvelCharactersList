//
//  MCListViewController.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import UIKit

protocol MCListViewProtocol: class {
    
}

class MCListViewController: UIViewController {
    
    var presenter: MCListPresenterProtol?

    override func viewDidLoad() {
        super.viewDidLoad()
        initScene()
    }
    
    private func initScene() {
        let interactor = MCListInteractor(repository: MCListrepository())
        let router = MCListRouter(with: self)
        let presenter = MCListPresenter(view: self, interactor: interactor, router: router)

        interactor.presenter = presenter
        self.presenter = presenter
        self.presenter?.viewDidLoad()
    }

}

extension MCListViewController: MCListViewProtocol {
    
}
