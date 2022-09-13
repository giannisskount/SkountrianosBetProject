//
//  MenuNetworkService.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import Foundation
import Combine

enum BetError {
    case unknown
}

class MenuNetworkService {
    
    static let GET_HEADLINES_URL = "http://www.mocky.io/v2/5d7113ef3300000e00779746"
    static let GET_GAMES_URL = "http://www.mocky.io/v2/5d7113513300000b2177973a"
    static let UPDATE_HEADLINES_URL = "http://www.mocky.io/v2/5d711461330000d135779748"
    static let UPDATE_GAMES_URL = "http://www.mocky.io/v2/5d7114b2330000112177974d"
    
    private let bearerToken: String
    
    private var headers: [String : String] {
        return  ["Authorization" : "Bearer " + bearerToken]
    }
    
    init(bearerToken: String) {
        self.bearerToken = bearerToken
    }
    
    func getHeadlines(completion: @escaping ([HeadLineResponse]?, BetError?) -> Void) {
                
        NetworkClient.executeRequest(url: Self.GET_HEADLINES_URL,
                                     headers: self.headers,
                                     httpMethod: .get,
                                     responseType: [HeadLineResponse].self) { response in
            
            if let response = response  {
                completion(response, nil)
                
            } else {
                completion(nil, BetError.unknown)
            }
        }
    }
    
    func getGames(completion: @escaping ([GetGame]?, BetError?) -> Void) {
        
        NetworkClient.executeRequest(url: Self.GET_GAMES_URL,
                                     headers: self.headers,
                                     httpMethod: .get,
                                     responseType: [GetGame].self) { response in
            
            if let response = response  {
                completion(response, nil)
                
            } else {
                completion(nil, BetError.unknown)
            }
        }
    }
    
    func updateHeadlines(completion: @escaping ([HeadLineResponse]?, BetError?) -> Void) {
                
        NetworkClient.executeRequest(url: Self.UPDATE_HEADLINES_URL,
                                     headers: self.headers,
                                     httpMethod: .get,
                                     responseType: [HeadLineResponse].self) { response in
            
            if let response = response  {
                completion(response, nil)
                
            } else {
                completion(nil, BetError.unknown)
            }
        }
    }
    
    func updateGames(completion: @escaping ([GetGame]?, BetError?) -> Void) {
        
        NetworkClient.executeRequest(url: Self.UPDATE_GAMES_URL,
                                     headers: self.headers,
                                     httpMethod: .get,
                                     responseType: [GetGame].self) { response in
            
            if let response = response  {
                completion(response, nil)
                
            } else {
                completion(nil, BetError.unknown)
            }
        }
    }
}

class LoginNetworkService {
    
    static let LOGIN_URL = "https://www.mocky.io/v2/5d8e4bd9310000a2612b5448"
    
    static func loginCall(username: String, password: String, completion: @escaping (LoginResponse?, BetError?) -> Void) {
        
        NetworkClient.executeRequest(url: Self.LOGIN_URL,
                                     httpMethod: .post,
                                     responseType: LoginResponse.self) { response in
            
            if let response = response  {
                completion(response, nil)
                
            } else {
                completion(nil, BetError.unknown)
            }
        }
    }
}
