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
    
    static let loginURL = "https://www.mocky.io/v2/5d8e4bd9310000a2612b5448"
    
    static func loginCall(completion: @escaping (LoginResponse?, BetError?) -> Void) {
        
        let url = URL(string: "https://www.mocky.io/v2/5d8e4bd9310000a2612b5448")!
        let params = LoginRequest.init(userName: "test", password: "test2")
        var request = URLRequest.init(url: url)
        
        if let data = try? JSONEncoder().encode(params) {
            // The JSON data is in bytes. Let's printit as a JSON string.
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            request.httpBody = data
        }
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    completion(loginResponse, nil)
                } else {
                    print("Invalid Response")
                    completion(nil, BetError.unknown)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
                completion(nil, BetError.unknown)
            }
        }
        
        task.resume()
    }
}
