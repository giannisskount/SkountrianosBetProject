//
//  MenuModel.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22.
//

import Foundation

enum MenuModel {
    
    class DataModel {
        
        var headlinesDM: [HeadLineDM]?
        var getGames: [GetGame]?
        
        init() {}
        
        func updateData(headlinesDM: [HeadLineDM]?) {
            self.headlinesDM = headlinesDM
        }
        
        func updateData(getGames: [GetGame]?) {
            self.getGames = getGames
        }
    }
    
    class MenuTableViewDataSource: TableViewDataSource {
        
        init(dataModel: DataModel) {
            
            super.init(sectionData: [])
            self.constructTableSections(dataModel: dataModel)
        }
        
        func constructTableSections(dataModel: DataModel) {
            
            if let headlinesTableViewSectionData = self.constructHeadlineSections(headlinesDM: dataModel.headlinesDM) {
                for headlineSectionData in headlinesTableViewSectionData {
                    self.sectionData.append(headlineSectionData)
                }
            }
            
            if let gamesTableViewSectionData = self.constructGamesSections(getGames: dataModel.getGames) {
                for gameSectionData in gamesTableViewSectionData {
                    self.sectionData.append(gameSectionData)
                }
            }
        }
        
        func constructGamesSections(getGames: [GetGame]?) -> [TableViewDataSource.SectionData]? {
            
            guard let betViews = getGames?.first?.betViews else {
                return nil
            }
            
            var sectionData = [TableViewDataSource.SectionData]()
            
            for betView in betViews {
                
                var cellData = [GamesTableViewCellData]()
                if let competitions = betView.competitions  {
                    for competition in competitions {
                        if let events = competition.events {
                            for event in events {
                                
                                let gameCellData = GamesTableViewCellData.init(competitor1Caption: event.additionalCaptions?.competitor1,
                                                                               competitor2Caption: event.additionalCaptions?.competitor2,
                                                                               elapsedTime: event.liveData?.elapsedTimeDate,
                                                                               betItems: event.markets?.first?.betItems)
                                
                                cellData.append(gameCellData)
                            }
                        }
                    }
                }
                
                let gamesSectionData = TableViewDataSource.SectionData.init(sectionId: betView.betViewKey,
                                                                            sectionTitle: betView.competitionContextCaption,
                                                                            sectionType: .games,
                                                                            cellData: cellData)
                sectionData.append(gamesSectionData)
            }
            
            return sectionData
        }
        
        func constructHeadlineSections(headlinesDM: [HeadLineDM]?) -> [TableViewDataSource.SectionData]? {
            
            guard let headlinesDM = headlinesDM else {
                return nil
            }
            
            var sectionData = [TableViewDataSource.SectionData]()
            
            for headlineDM in headlinesDM {
                
                let headlineCellData = HeadlinesCollectionCellDatasource.init(headline: headlineDM)
                
                let headLinesTableViewCellData = HeadLinesCellTableViewCellData.init(uniqueIdentifier: headlineDM.marketViewKey,
                                                                                     headlinesCollectionViewDependencies: headlineCellData)
                
                let headlineSectionData = TableViewDataSource.SectionData.init(sectionId: headlineDM.marketViewKey,
                                                                               sectionTitle: nil,
                                                                               sectionType: .headlines,
                                                                               cellData: [headLinesTableViewCellData])
                
                
                sectionData.append(headlineSectionData)
            }
            
            return sectionData
        }
    }
    
    class HeadlinesCollectionCellDatasource: CollectionViewDataSource {
        
        init(headline: HeadLineDM) {
            
            super.init(sectionData: [],
                       uniqueIdentifier: "")
            
            guard let betViews = headline.betViews else {
                return
            }
            
            var collectionCellDataArray = [HeadLinesCollectionViewCellData]()
            
            for betView in betViews {
                
                let collectionCellData = HeadLinesCollectionViewCellData.init(competitor1Caption: betView.competitor1Caption,
                                                                              competitor2Caption: betView.competitor2Caption,
                                                                              startTime: betView.startTime,
                                                                              uniqueIdentifier: betView.betViewKey)
                collectionCellDataArray.append(collectionCellData)
            }
            
            let sectionData = CollectionViewDataSource.SectionData.init(sectionId: headline.marketViewKey,
                                                                        sectionTitle: nil,
                                                                        cellData: collectionCellDataArray)
            self.sectionData.append(sectionData)
        }
    }
}
