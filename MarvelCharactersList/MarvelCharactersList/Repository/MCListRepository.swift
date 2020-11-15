//
//  MCListRepository.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import Alamofire

protocol MCListrepositoryProtocol {
    func fetchCharactersList(completion: @escaping (Result<Bool, Error>) -> Void)
}

class MCListrepository: MCListrepositoryProtocol {
    private let publicKey = "5aee58147a25e22e3ae02c94b5b8dc5a"
    private let privateKey = "bf7aa4965388219361b098ffccb2c9f660f8c20c"
    
    private let host = "https://gateway.marvel.com:443"
    
    func getParameters() -> [String: String] {
        let timeStamp = Date().timeIntervalSince1970
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".MD5()
        let parameters = ["apikey": publicKey,
                          "ts": "\(timeStamp)",
                          "hash": hash,
                          ]
        return parameters
    }
}

// MARK: - Character list calls
extension MCListrepository {
    func fetchCharactersList(completion: @escaping (Result<Bool, Error>) -> Void) {
        let request = "/v1/public/characters"
        let url = "\(host)\(request)"
        
        AF.request(url, parameters: getParameters(), encoder: URLEncodedFormParameterEncoder.default).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                debugPrint("response: \(data)")
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Character detail calls
extension MCListrepository {
    
}
