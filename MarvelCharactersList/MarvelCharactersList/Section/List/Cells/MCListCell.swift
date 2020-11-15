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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        prepareIconView()
    }
    
    private func prepareIconView() {
        iconView.layer.cornerRadius = iconView.bounds.height / 2
        iconView.layer.borderWidth = 1
        iconView.layer.borderColor = UIColor.red.cgColor
        iconView.contentMode = .scaleAspectFill
    }
    
    func set(with character: MCListCharacter) {
        titleLabel.text = character.name
        descriptionLabel.text = character.resultDescription
        descriptionView.isHidden = character.resultDescription.isEmpty
        iconView.getMarvelAsset(url: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")
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
