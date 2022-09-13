//
//  MenuViewModel.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import Foundation
import Combine

enum MenuInitializeResult {
    case success
    case failure
}

class MenuViewModel {
    
    private var menuNetworkService: MenuNetworkService
    var dataModel = MenuModel.DataModel()
    
    let initializeValidationResult = PassthroughSubject<MenuInitializeResult, Never>()
    
    init(bearerToken: String) {
        self.menuNetworkService = MenuNetworkService.init(bearerToken: bearerToken)
    }
    
    func initializeData() {
        
        let dispatchGroup = DispatchGroup.init()
        
        dispatchGroup.enter()
        self.initializeHeadlines {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.initializeGetGames {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.initializeValidationResult.send(.success)
        }
    }
    
    func initializeHeadlines(completion: @escaping () -> Void) {
        
        self.menuNetworkService.getHeadlines { [weak self] response, error in
            
            if let thisResponse = response {
                self?.dataModel.updateData(headlinesDM: thisResponse.map(HeadLineDM.init))
            }
            completion()
        }
    }
    
    func initializeGetGames(completion: @escaping () -> Void) {
        self.menuNetworkService.getGames { [weak self] response, error in
            
            DispatchQueue.main.async {
                self?.dataModel.updateData(getGames: response)
            }
            completion()
        }
    }
    
    func updateHeadlines(completion: @escaping () -> Void) {
        self.menuNetworkService.updateHeadlines { [weak self] response, error in
            
            DispatchQueue.main.async {
                if let thisResponse = response {
                    self?.dataModel.updateData(headlinesDM: thisResponse.map(HeadLineDM.init))
                }
                completion()
            }
        }
    }
    
    func updateGame(completion: @escaping () -> Void) {
        self.menuNetworkService.updateGames { [weak self] response, error in
            
            DispatchQueue.main.async {
                self?.dataModel.updateData(getGames: response)
                completion()
            }
        }
    }
}

class HeadLineDM {
    
    var betViews: [HeadLineResponseBetView]?
    var marketViewKey: String?
    
    init(headlinesResponse: HeadLineResponse) {
        self.betViews = headlinesResponse.betViews
        self.marketViewKey = headlinesResponse.marketViewKey
    }
}
