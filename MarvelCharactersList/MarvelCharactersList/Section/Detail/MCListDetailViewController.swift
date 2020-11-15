//
//  MCListDetailViewController.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import UIKit

protocol MCListDetailProtocol: class {
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
    
    let spinnerView = UIView()
    let spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        guard let thisCharacter = character else { return }
        presenter?.viewDidLoad(with: thisCharacter)
    }

    private func initUI() {
        setNavigationController()
        setTalbeView()
        characterImage.getMarvelAsset(url: character?.getThumbnail() ?? "")
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
        let alert = UIAlertController(title: "Ups...", message: "Coldn't load the data right now.\nPlase try again.", preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner() {
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
        view.backgroundColor = .white
        spinner.stopAnimating()
        spinner.removeFromSuperview()
        spinnerView.removeFromSuperview()
    }
}
