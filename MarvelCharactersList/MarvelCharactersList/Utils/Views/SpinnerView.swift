//
//  SpinnerView.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 24/10/21.
//

import UIKit

final class SpinnerView: UIView {
    let parent: UIView
    let spinner = UIActivityIndicatorView(style: .large)
    let spinnerView = UIView()
    
    init(parent: UIView) {
        self.parent = parent
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startSpinnerView() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        spinner.startAnimating()
        spinnerView.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.backgroundColor = .gray
        spinnerView.alpha = 0.5
        parent.addSubview(spinnerView)
        spinnerView.heightAnchor.constraint(equalTo: parent.heightAnchor).isActive = true
        spinnerView.widthAnchor.constraint(equalTo: parent.widthAnchor).isActive = true
    }
    
    public func stopSpinner() {
        parent.backgroundColor = .white
        spinner.stopAnimating()
        spinner.removeFromSuperview()
        spinnerView.removeFromSuperview()
    }
}
