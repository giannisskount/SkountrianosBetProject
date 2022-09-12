//
//  MenuTableView.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 11/9/22.
//

import UIKit

class MenuTableView: UITableView {
    
    var dependencies: TableViewDataSource? 
    
    enum CellIdentifier: String {
        case HeadLinesCellTableViewCell
        case GamesTableViewCell
    }
    
    init() {
                
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 44.0
        self.backgroundColor = BetColor.mainBackgroundColor
        
        self.registerToCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerToCells() {
        
        self.register(UINib.init(nibName: "HeadLinesCellTableViewCell", bundle: nil),
                      forCellReuseIdentifier: "HeadLinesCellTableViewCell")
        self.register(UINib.init(nibName: "GamesTableViewCell", bundle: nil),
                      forCellReuseIdentifier: "GamesTableViewCell")
    }
    
    @objc private func hideSection(sender: UIButton) {
        
        let section = sender.tag// Create section let
        
        guard let thisDependencies = dependencies else {
            return
        }
        
        if thisDependencies.hiddenSections.contains(section) {
            thisDependencies.hiddenSections.remove(section)
            self.insertRows(at: indexPathsForSection(section: section),
                                       with: .fade)
        } else {
            self.dependencies?.hiddenSections.insert(section)
            self.deleteRows(at: indexPathsForSection(section: section),
                            with: .fade)
        }
    }
    
    func indexPathsForSection(section: Int) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        
        guard let thisDependencies = dependencies else {
            return indexPaths
        }
        
        for row in 0..<thisDependencies.sectionData[section].cellData.count {
            indexPaths.append(IndexPath(row: row,
                                        section: section))
        }
        
        return indexPaths
    }
}

extension MenuTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let sectionData = self.dependencies?.sectionData else {
            return nil
        }
        
        guard let sectionTitle = sectionData[safe: section]?.sectionTitle else {
            return nil
        }
        
        let sectionButton = UIButton()
        
        sectionButton.setTitle(sectionTitle,
                               for: .normal)
        sectionButton.backgroundColor = UIColor.init(red: 35, green: 43, blue: 54)
        
        sectionButton.tag = section
        
        sectionButton.addTarget(self,
                                action: #selector(self.hideSection(sender:)),
                                for: .touchUpInside)
        return sectionButton
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (self.dependencies?.sectionData[safe: section]?.sectionTitle != nil) ? 45 : 0
    }
}

extension MenuTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let thisDependencies = self.dependencies else {
            return 0
        }
        
        if thisDependencies.hiddenSections.contains(section) {
            return 0
        }
        
        return thisDependencies.sectionData[section].cellData.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dependencies?.sectionData.count ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        let cellData = self.dependencies?.sectionData[safe: section]?.cellData[safe: row]
        
        guard let thisCellIdentifier = cellData?.cellIdentifier else {
            return TableViewCell.init()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: thisCellIdentifier,
                                                       for: indexPath) as? TableViewCell else {
            return TableViewCell.init()
        }
        
        cell.setData(cellData: cellData)
        
        return cell
    }
}
