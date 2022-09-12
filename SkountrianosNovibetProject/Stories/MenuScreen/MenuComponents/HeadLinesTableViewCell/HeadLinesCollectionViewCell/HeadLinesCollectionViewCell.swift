//
//  HeadLinesCollectionViewCell.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 11/9/22.
//

import UIKit

class HeadLinesCollectionViewCellData: CollectionViewDataSource.CellData {
    
    var competitor1Caption: String?
    var competitor2Caption: String?
    var startTime: String?
    
    init(competitor1Caption: String?,
         competitor2Caption: String?,
         startTime: String?,
         uniqueIdentifier: String?) {
        
        super.init(cellIdentifier: .HeadLinesCollectionViewCell,
                   uniqueIdentifier: uniqueIdentifier)
        
        self.competitor1Caption = competitor1Caption
        self.competitor2Caption = competitor2Caption
        self.startTime = startTime
    }
}

class HeadLinesCollectionViewCell: CollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var competitor1Caption: UILabel!
    @IBOutlet weak var competitor2Caption: UILabel!
    @IBOutlet weak var startTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.containerView.layer.cornerRadius = 10
        self.containerView.backgroundColor = BetColor.headlinesBackgroundColor
    }
    
    override func setData(cellData: CollectionViewDataSource.CellData?) {
        
        guard let cellData = cellData as? HeadLinesCollectionViewCellData else {
            return
        }
        
        self.competitor1Caption.text = cellData.competitor1Caption ?? ""
        self.competitor2Caption.text = cellData.competitor2Caption ?? ""
        self.startTime.text = cellData.startTime ?? ""
    }
}
