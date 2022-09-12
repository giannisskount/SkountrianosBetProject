//
//  GamesTableViewCell.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 11/9/22.
//

import UIKit

class GamesTableViewCellData: TableViewDataSource.CellData {
    
    var competitor1Caption: String?
    var competitor2Caption: String?
    var elapsedTime: String?
    
    init(competitor1Caption: String?,
         competitor2Caption: String?,
         elapsedTime: String?) {
        
        self.competitor1Caption = competitor1Caption
        self.competitor2Caption = competitor2Caption
        self.elapsedTime = elapsedTime
        
        super.init(cellIdentifier: MenuTableView.CellIdentifier.GamesTableViewCell.rawValue,
                   uniqueIdentifier: "whatever")
    }
}

class GamesTableViewCell: TableViewCell {

    @IBOutlet weak var competitor1Caption: UILabel!
    @IBOutlet weak var competitor2Caption: UILabel!
    @IBOutlet weak var elapsedTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setData(cellData: TableViewDataSource.CellData?) {
    
        guard let cellData = cellData as? GamesTableViewCellData else {
            return
        }
        
        self.competitor1Caption.text = cellData.competitor1Caption
        self.competitor2Caption.text = cellData.competitor2Caption
        self.elapsedTime.text = cellData.elapsedTime
    }
}
