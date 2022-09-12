//
//  NetworkClient.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22.
//

import Foundation

class NetworkClient {
        
    enum HttpMethod: String {
        
        case get = "GET"
        case post = "POST"
    }
    
    static func executeRequest<T: Codable>(url: String,
                                           headers: [String: String] = [:],
                                           httpMethod: HttpMethod,
                                           responseType: T.Type,
                                           completion: @escaping (T?) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest.init(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = httpMethod.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                
                if let response = try? jsonDecoder.decode(T.self, from: data) {
                    completion(response)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
