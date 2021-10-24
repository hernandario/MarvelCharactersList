//
//  UIAlertController+Extension.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 24/10/21.
//

import UIKit

extension UIAlertController {
    public enum alertType {
        case fetchFail
    }
    
    static func getAlertForType(_ type: alertType, refreshAction: (() -> Void)? = nil) -> UIAlertController {
        switch type {
        case .fetchFail:
            return getFetchFailAlert(refreshAction: refreshAction)
        }
    }
    
    private static func getFetchFailAlert(refreshAction: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "Ups...", message: "Coldn't load the data right now.\nPlase try again.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        if refreshAction != nil {
            let refresh = UIAlertAction(title: "Try again", style: .default) { (alert) in
                refreshAction?()
            }
            alert.addAction(refresh)
        }
        return alert
    }
}
