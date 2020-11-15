//
//  MCListCell.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import UIKit

class MCListCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func set(with character: MCListCharacter) {
        titleLabel.text = character.name
    }
}

extension MCListCell {
    public static func registerCell(for tableView: UITableView) {
        let nib = UINib(nibName: MCListCell.reuseIdentifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: MCListCell.reuseIdentifier)
    }
    
    public static func getCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, with model: MCListCharacter) -> MCListCell?  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MCListCell.reuseIdentifier, for: indexPath) as? MCListCell else { return nil }
        cell.set(with: model)
        return cell
    }
}
