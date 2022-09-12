//
//  MenuViewModel.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import Foundation

class MenuViewModel {
        
    private var menuNetworkService: MenuNetworkService

    var headlinesDM: [HeadLineDM]?
    var getGame: [GetGame]?
        
    var dataModel =  MenuModel.DataModel()
    
    init(bearerToken: String) {
        self.menuNetworkService = MenuNetworkService.init(bearerToken: bearerToken)
    }
    
    func initializeData(completion: @escaping () -> Void) {
        
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
            completion()
        }
    }
    
    func initializeHeadlines(completion: @escaping () -> Void) {
        
        self.menuNetworkService.getHeadlines { [weak self] response, error in
            
            if let thisResponse = response {
                self?.headlinesDM = thisResponse.map(HeadLineDM.init)
            }
            self?.dataModel.updateData(headlinesDM: self?.headlinesDM)
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
                    self?.headlinesDM = thisResponse.map(HeadLineDM.init)
                }
                self?.dataModel.updateData(headlinesDM: self?.headlinesDM)
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
