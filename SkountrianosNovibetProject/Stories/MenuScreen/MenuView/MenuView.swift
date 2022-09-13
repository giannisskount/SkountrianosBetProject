//
//  MenuView.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit

class MenuView: UIView {
    
    lazy var navigationBarView = BetNavigationBarView()    
    lazy var tableView = MenuTableView()
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = BetColor.primaryColor
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [navigationBarView, tableView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            navigationBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navigationBarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 80),
            
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor)
        ])
    }
    
    func update(dataSource: TableViewDataSource) {
        self.tableView.dependencies = dataSource
        self.tableView.reloadData()
    }
    
    func scrollHeadlines() {
        
        self.tableView.getSections(sectionType: .headlines)?.enumerated()
            .flatMap ({ self.tableView.indexPathsForSection(section: $0.offset) })
            .compactMap ({ self.tableView.cellForRow(at: $0) as? HeadLinesCellTableViewCell })
            .forEach ({ $0.scroll() })
    }
    
    func updateElapsedTime() {
        
        guard let gamesSections = self.tableView.getSections(sectionType: .games) else {
            return
        }
        
        gamesSections
            .forEach { section in
                (self.tableView.dependencies?.sectionData[section].cellData as? [GamesTableViewCellData])?
                    .forEach {
                        $0.addSecond()
                    }
            }
        
        gamesSections
            .flatMap { self.tableView.indexPathsForSection(section: $0) }
            .compactMap { self.tableView.cellForRow(at: $0) as? GamesTableViewCell }
            .forEach { $0.addSecond() }
    }
}
