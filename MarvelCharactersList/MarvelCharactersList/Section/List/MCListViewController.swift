//
//  MCListViewController.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import UIKit

protocol MCListViewProtocol: AnyObject {
    func showSpinner()
    func removeSpinner()
    func fetchDidSucces(newItems: [MCListCharacter])
    func fetchDidFail()
}

class MCListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    var items = [MCListCharacter]()
    var presenter: MCListPresenterProtol?
    var offSet: Int = 0
    var isLoading = false
    var responseLimit = 20
    var spinnerView: SpinnerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSpinner()
        initScene()
        initUI()
    }
    
    private func initScene() {
        let interactor = MCListInteractor(repository: MCListrepository())
        let router = MCListRouter(with: self)
        self.presenter = MCListPresenter(view: self, interactor: interactor, router: router)
        interactor.presenter = presenter
        self.presenter?.fetchCharacters(offset: offSet, responseLimit: responseLimit)
    }
    
    private func initUI() {
        setNavigationController()
        setTalbeView()
    }
    
    private func setSpinner() {
        spinnerView = SpinnerView(parent: self.view)
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Marvel Characters"
    }
    
    private func setTalbeView() {
        tableView.dataSource = self
        tableView.delegate = self
        MCListCell.registerCell(for: tableView)
    }
    
    @IBAction func refreshButtonDidTap(_ sender: Any) {
        items = []
        tableView.reloadData()
        offSet = 0
        presenter?.fetchCharacters(offset: offSet, responseLimit: responseLimit)
    }
    
    func onCancelAlertDidTap() {
        refreshButtonDidTap(self)
    }
}

//MARK: - MCListViewProtocol
extension MCListViewController: MCListViewProtocol {
    func fetchDidSucces(newItems: [MCListCharacter]) {
        offSet += responseLimit
        isLoading = false
        updateTableView(with: newItems)
    }
    
    func fetchDidFail() {
        let alert = UIAlertController.getAlertForType(.fetchFail, refreshAction: onCancelAlertDidTap)
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner() {
        refreshButton.isEnabled = false
        spinnerView?.startSpinnerView()
    }
    
    func removeSpinner() {
        refreshButton.isEnabled = true
        spinnerView?.stopSpinner()
    }
}
