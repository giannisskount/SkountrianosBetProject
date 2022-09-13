//
//  TableViewDataSource.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 11/9/22.
//

import Foundation

class TableViewDataSource {
    
    var sectionData: [SectionData]
    var hiddenSections = Set<Int>()
    
    init(sectionData: [SectionData]) {
        
        self.sectionData = sectionData
    }
    
    class SectionData {
        
        enum SectionType {
            case headlines
            case games
        }
        
        var sectionId: String?
        var sectionTitle: String?
        var sectionType: SectionType?
        var cellData: [CellData]
        
        init(sectionId: String? = nil,
             sectionTitle: String? = nil,
             sectionType: SectionType?,
             cellData: [CellData]) {
            
            self.sectionId = sectionId
            self.sectionTitle = sectionTitle
            self.sectionType = sectionType
            self.cellData = cellData
        }
    }
    
    class CellData {
        
        var cellIdentifier: String?
        var uniqueIdentifier: String?
        
        init(cellIdentifier: String?,
             uniqueIdentifier: String?) {
            
            self.cellIdentifier = cellIdentifier
            self.uniqueIdentifier = uniqueIdentifier
        }
    }
}
