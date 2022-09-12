//
//  HeadLinesCellTableViewCell.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit

class HeadLinesCellTableViewCellData: TableViewDataSource.CellData {
    
    var data: CollectionViewDataSource?
    
    init(uniqueIdentifier: String?,
         headlinesCollectionViewDependencies: CollectionViewDataSource?) {
        
        self.data = headlinesCollectionViewDependencies
        super.init(cellIdentifier: MenuTableView.CellIdentifier.HeadLinesCellTableViewCell.rawValue,
                   uniqueIdentifier: uniqueIdentifier)
    }
}


class HeadLinesCellTableViewCell: TableViewCell {

    @IBOutlet weak var collectionView: PagingCollectionView!
        
    var scrollTimer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.scrollTimer = nil
    }
    
    override func setData(cellData: TableViewDataSource.CellData?) {
        
        guard let cellData = cellData as? HeadLinesCellTableViewCellData else {
            return
        }
        
        self.collectionView.dependencies = cellData.data
        
        if self.scrollTimer != nil {
            self.scrollTimer?.invalidate()
            self.scrollTimer = nil
        } else {
            self.startTimer()
        }
    }
    
    func startTimer() {

        let timer = Timer(timeInterval: 5, repeats: true) { [weak self] _ in
            self?.scrollAutomatically()
        }
        RunLoop.current.add(timer, forMode: .common)
        self.scrollTimer = timer
    }


    func scrollAutomatically() {

        guard let collectionView = self.collectionView else {
            return
        }
    
        guard let currentCell = collectionView.visibleCells.first,
              let currentIndexPath = collectionView.indexPath(for: currentCell) else {
            return
        }
        
        guard let totalCells = self.collectionView?.dependencies?.sectionData[0].cellData.count else {
            return
        }
                
        if currentIndexPath.row < totalCells - 1 {
            let newIndexPath = IndexPath.init(row: currentIndexPath.row + 1, section: 0)
            collectionView.scrollToItem(at: newIndexPath, at: .right, animated: true)
        } else {
            let newIndexPath = IndexPath.init(row: 0, section: 0)
            collectionView.scrollToItem(at: newIndexPath, at: .left, animated: true)
        }
    }
}
