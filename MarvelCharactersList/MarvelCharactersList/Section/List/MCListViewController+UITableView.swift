//
//  MCListViewController+UITableView.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import UIKit

// MARK: - UITableView
extension MCListViewController {
    func updateTableView(with newItems: [MCListCharacter]) {
        tableView.beginUpdates()
        newItems.forEach { (character) in
            items.append(character)
            tableView.insertRows(at: [IndexPath(row: items.count - 1, section: 0)], with: .bottom)
        }
        tableView.endUpdates()
    }
}

extension MCListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = MCListCell.getCell(tableView, cellForRowAt: indexPath, with: items[indexPath.row]) else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !isLoading && indexPath.row == items.count - 1 {
            isLoading = true
            presenter?.fetchCharacters(offset: offSet, responseLimit: responseLimit)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCharacter(items[indexPath.row])
    }
}
