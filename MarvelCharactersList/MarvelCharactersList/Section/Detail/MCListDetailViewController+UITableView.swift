//
//  MCListDetailViewController+UITableView.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import UIKit

extension MCListDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return character?.resultDescription.isEmpty ?? false ? 0 : 1
        case 1: return character?.comics.items.count ?? 0
        case 2: return character?.series.items.count ?? 0
        case 3: return character?.stories.items.count ?? 0
        case 4: return character?.events.items.count ?? 0
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Description"
        case 1: return "Comics"
        case 2: return "Series"
        case 3: return "Stories"
        case 4: return "Events"
        default:
            return ""
        }
    }
}

extension MCListDetailViewController {
    func getCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        switch section {
        case 0: return getDescriptionCell()
        case 1: return getComicCell(for: row)
        case 2: return getSeriesCell(for: row)
        case 3: return getStoryCell(for: row)
        case 4: return getEventCell(for: row)
        default:
            return UITableViewCell()
        }
    }
    
    func getDescriptionCell() -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = character?.resultDescription
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func getComicCell(for row: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = character?.comics.items[row].name
        return cell
    }
    
    func getSeriesCell(for row: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = character?.series.items[row].name
        return cell
    }
    
    func getStoryCell(for row: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = character?.stories.items[row].name
        return cell
    }
    
    func getEventCell(for row: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = character?.events.items[row].name
        return cell
    }
}
