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
    
    let spinnerView = UIView()
    let spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScene()
        initUI()
    }
    
    private func initScene() {
        let interactor = MCListInteractor(repository: MCListrepository())
        let router = MCListRouter(with: self)
        let presenter = MCListPresenter(view: self, interactor: interactor, router: router)

        interactor.presenter = presenter
        self.presenter = presenter
        self.presenter?.fetchCharacters(offset: offSet, responseLimit: responseLimit)
    }
    
    private func initUI() {
        setNavigationController()
        setTalbeView()
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
}

//MARK: - MCListViewProtocol
extension MCListViewController: MCListViewProtocol {
    func fetchDidSucces(newItems: [MCListCharacter]) {
        offSet += responseLimit
        isLoading = false
        updateTableView(with: newItems)
    }
    
    func fetchDidFail() {
        let alert = UIAlertController(title: "Ups...", message: "Coldn't load the data right now.\nPlase try again.", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let refresh = UIAlertAction(title: "Refresh", style: .default) { [weak self] (alert) in
            self?.refreshButtonDidTap(alert)
        }
        
        alert.addAction(refresh)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner() {
        refreshButton.isEnabled = false
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        spinner.startAnimating()
        spinnerView.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
        
        
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.backgroundColor = .gray
        spinnerView.alpha = 0.5
        view.addSubview(spinnerView)
        
        
        spinnerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        spinnerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func removeSpinner() {
        refreshButton.isEnabled = true
        view.backgroundColor = .white
        spinner.stopAnimating()
        spinner.removeFromSuperview()
        spinnerView.removeFromSuperview()
    }
}
