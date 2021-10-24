//
//  MCListDetailViewController.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import UIKit

protocol MCListDetailProtocol: AnyObject {
    func showSpinner()
    func removeSpinner()
    func fetchDidSucces(character: MCListCharacter)
    func fetchDidFail()
}

class MCListDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var characterImage: UIImageView!
    var character: MCListCharacter?
    var presenter: MCListDetailPresenterProtol?
    var spinnerView: SpinnerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        guard let thisCharacter = character else { return }
        presenter?.viewDidLoad(with: thisCharacter)
    }

    private func initUI() {
        setSpinner()
        setNavigationController()
        setTalbeView()
        characterImage.getMarvelAsset(url: character?.getThumbnail() ?? "")
    }
    
    private func setSpinner() {
        spinnerView = SpinnerView(parent: self.view)
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = character?.name
    }
    
    private func setTalbeView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MCListDetailViewController: MCListDetailProtocol {
    
    func fetchDidSucces(character: MCListCharacter) {
        self.character = character
        characterImage.getMarvelAsset(url: self.character?.getThumbnail() ?? "")
        tableView.reloadData()
    }
    
    func fetchDidFail() {
        let alert = UIAlertController.getAlertForType(.fetchFail)
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner() {
        spinnerView?.startSpinnerView()
    }
    
    func removeSpinner() {
        spinnerView?.stopSpinner()
    }
}
