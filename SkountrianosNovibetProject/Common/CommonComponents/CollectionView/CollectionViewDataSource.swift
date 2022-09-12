//
//  CollectionViewDataSource.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 11/9/22.
//

import Foundation

class CollectionViewDataSource {
    
    var sectionData: [SectionData]
    var uniqueIdentifier: String?
    
    init(sectionData: [SectionData],
         uniqueIdentifier: String?) {
        self.sectionData = sectionData
        self.uniqueIdentifier = uniqueIdentifier
    }
    
    class SectionData {
        
        var sectionId: String?
        var sectionTitle: String?
        var cellData: [CellData]
        
        init(sectionId: String?,
             sectionTitle: String? = nil,
             cellData: [CellData]) {
            
            self.sectionId = sectionId
            self.sectionTitle = sectionTitle
            self.cellData = cellData
        }
    }
    
    class CellData {
        
        var cellIdentifier: PagingCollectionView.CellIdentifier?
        var uniqueIdentifier: String?
        
        init(cellIdentifier: PagingCollectionView.CellIdentifier,
             uniqueIdentifier: String?) {
            
            self.cellIdentifier = cellIdentifier
            self.uniqueIdentifier = uniqueIdentifier
        }
    }
}
