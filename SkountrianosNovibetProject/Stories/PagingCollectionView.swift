//
//  PagingCollectionView.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit

class PagingCollectionView: UICollectionView {
    
    enum CellIdentifier: String {
        case HeadLinesCollectionViewCell
    }
    
    var dependencies: CollectionViewDataSource? {
        didSet {
            self.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = true
        self.delegate = self
        self.dataSource = self
        
        self.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.contentInsetAdjustmentBehavior = .never
        
        self.collectionViewLayout = layout
        self.register(UINib.init(nibName: "HeadLinesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeadLinesCollectionViewCell")
    }
}

extension PagingCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        let cellData = self.dependencies?.sectionData[safe: section]?.cellData[safe: row]

        guard let thisCellIdentifier = cellData?.cellIdentifier?.rawValue else {
            return CollectionViewCell.init()
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thisCellIdentifier,
                                                            for: indexPath) as? CollectionViewCell else {
            return CollectionViewCell.init()
        }
        
        cell.setData(cellData: cellData)
                
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dependencies?.sectionData[safe: section]?.cellData.count ?? 0
    }
}

extension PagingCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height - 30)
    }
}
