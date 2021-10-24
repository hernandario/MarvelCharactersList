//
//  UIImageView+Extension.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import Kingfisher

extension UIImageView {
    public func getMarvelAsset(url: String) {
        let placeHolder = UIImage(named: "defaultLogo")
        let timeStamp = Date().timeIntervalSince1970
        let hash = "\(timeStamp)\(MCListrepository.privateKey)\(MCListrepository.publicKey)".MD5()
        let params = "?apikey=\(MCListrepository.publicKey)&ts=\(timeStamp)&hash=\(hash)"
        guard let imageUrl = URL(string: "\(url)\(params)") else {
            self.image = placeHolder
            return
        }
        // Adds cache key manualy becouse the timestamp in the request is going to be always diferent. 
        let imageResource = ImageResource(downloadURL: imageUrl, cacheKey: url)
        self.kf.setImage(with: imageResource, placeholder: placeHolder)
    }
}
