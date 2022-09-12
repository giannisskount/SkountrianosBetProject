//
//  MenuViewController.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit

class MenuViewController: UIViewController {
    
    private lazy var contentView = MenuView()
    private var viewModel: MenuViewModel
    
    var tableTimer: Timer?
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("MenuViewController - viewDidAppear(:)")
        self.viewModel.initializeData {
            self.update()
            self.startTableUpdates()
        }
    }
    
    deinit {
        tableTimer?.invalidate()
        tableTimer = nil
    }
    
    func startTableUpdates() {
        tableTimer = Timer.scheduledTimer(timeInterval: 9, target: self, selector: #selector(self.updateTableData), userInfo: nil, repeats: true)
    }
    
    func update() {
        
        let tableViewDatasource = MenuModel.MenuTableViewDataSource.init(dataModel: self.viewModel.dataModel)
        self.contentView.update(dataSource: tableViewDatasource)
    }
    
    @objc func updateTableData() {
        self.viewModel.updateHeadlines {
            self.update()
        }
        self.viewModel.updateGame {
            self.update()
        }
    }
}
