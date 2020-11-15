//
//  MCListRepository.swift
//  MarvelCharactersList
//
//  Created by Hernán Villamil on 15/11/20.
//

import Foundation
import Alamofire

protocol MCListrepositoryProtocol {
    func fetchCharactersList(offset: Int, responseLimit: Int, completion: @escaping (Result<[MCListCharacter], Error>) -> Void)
}

class MCListrepository: MCListrepositoryProtocol {
    public static let publicKey = "5aee58147a25e22e3ae02c94b5b8dc5a"
    public static let privateKey = "bf7aa4965388219361b098ffccb2c9f660f8c20c"
    
    private let host = "https://gateway.marvel.com:443"
    
    func getParameters(offset: Int, responseLimit: Int) -> [String: String] {
        let timeStamp = Date().timeIntervalSince1970
        let hash = "\(timeStamp)\(MCListrepository.privateKey)\(MCListrepository.publicKey)".MD5()
        let parameters = ["apikey": MCListrepository.publicKey,
                          "ts": "\(timeStamp)",
                          "hash": hash,
                          "offset": "\(offset)",
                          "limit": "\(responseLimit)"]
        return parameters
    }
}

// MARK: - Character list calls
extension MCListrepository {
    func fetchCharactersList(offset: Int, responseLimit: Int,completion: @escaping (Result<[MCListCharacter], Error>) -> Void) {
        let request = "/v1/public/characters"
        let url = "\(host)\(request)"
        
        AF.request(url, parameters: getParameters(offset: offset, responseLimit: responseLimit), encoder: URLEncodedFormParameterEncoder.default).responseDecodable(of: MCListCharactersResponse.self) { (response) in
            switch response.result {
            case .success(let data):
                completion(.success(data.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Character detail calls
extension MCListrepository {
    
}
