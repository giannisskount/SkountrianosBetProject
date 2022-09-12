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
}
