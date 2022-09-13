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
    var elapsedTime: Date?
    
    var betItems: [BetItems]?
    
    init(competitor1Caption: String?,
         competitor2Caption: String?,
         elapsedTime: Date?,
         betItems: [BetItems]?) {
        
        self.competitor1Caption = competitor1Caption
        self.competitor2Caption = competitor2Caption
        self.elapsedTime = elapsedTime
        self.betItems = betItems
        
        super.init(cellIdentifier: MenuTableView.CellIdentifier.GamesTableViewCell.rawValue,
                   uniqueIdentifier: "whatever")
    }
    
    func addSecond() {
        
        guard let elapsedTimeDate = self.elapsedTime else {
            return
        }
        
        let newElapsedTime = Calendar.current.date(byAdding: .second, value: 1, to: elapsedTimeDate)
        
        self.elapsedTime = newElapsedTime
    }
}

class GamesTableViewCell: TableViewCell {

    @IBOutlet weak var competitor1Caption: UILabel!
    @IBOutlet weak var competitor2Caption: UILabel!
    @IBOutlet weak var elapsedTime: UILabel!
    
    var elapsedTimeDate: Date?  {
        didSet {
            self.updateElapsedTimeLabel(elapsedTimeDate: elapsedTimeDate)
        }
    }
    
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
        
        
        self.elapsedTimeDate = cellData.elapsedTime
    }
    
    func updateElapsedTimeLabel(elapsedTimeDate: Date?) {
        
        let elapsedTime = Calendar.current.dateComponents([.hour, .minute, .second], from: elapsedTimeDate ?? Date())
        
        let elapsedTimeString = String(format: "%02d:%02d:%02d", elapsedTime.hour ?? "--", elapsedTime.minute ?? "--", elapsedTime.second ?? "--")
        
        self.elapsedTime.text = elapsedTimeString
    }
    
    func addSecond() {
        
        guard let elapsedTimeDate = self.elapsedTimeDate else {
            return
        }
        
        let newElapsedTime = Calendar.current.date(byAdding: .second, value: 1, to: elapsedTimeDate)
        
        self.elapsedTimeDate = newElapsedTime
    }
}
