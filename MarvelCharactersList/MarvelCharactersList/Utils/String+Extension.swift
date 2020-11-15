//
//  String+Extension.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import CryptoKit

extension String {
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
