//
//  MCListViewController.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import UIKit

protocol MCListViewProtocol: class {
    func showSpinner()
    func removeSpinner()
}

class MCListViewController: UIViewController {
    
    var presenter: MCListPresenterProtol?
    
    var spinner = UIActivityIndicatorView(style: .large)

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
    func showSpinner() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func removeSpinner() {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
}
