//
//  MenuViewController.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit
import Combine

class MenuViewController: UIViewController {
    
    private lazy var contentView = MenuView()
    private var viewModel: MenuViewModel
    private var subscriptions = Set<AnyCancellable>()
        
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
        self.setupSubscriptions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.initializeData()
    }
        
    private func setupSubscriptions() {
        
        self.viewModel.initializeValidationResult
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] validationResult in
                switch validationResult {
                case .success:
                    self.handleSuccessfullInitializeData()
                case .failure:
                    // Needs implementation when we handle errors from response
                    print("MenuViewController - initializeValidationResult: failure(:)")
                }
            }
            .store(in: &subscriptions)
    }
    
    func handleSuccessfullInitializeData() {
        
        self.update()
        self.setupTimerSubscriptions()
    }
    
    func setupTimerSubscriptions() {
        
        Timer.publish(every: 5.0, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] _ in
                self.contentView.scrollHeadlines()
            }
            .store(in: &subscriptions)
        
        Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] _ in
                self.contentView.updateElapsedTime()
            }
            .store(in: &subscriptions)
        
        Timer.publish(every: 10.0, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] _ in
                self.fetchHeadlines()
            }
            .store(in: &subscriptions)
    }
    
    private func fetchHeadlines() {
        
        self.viewModel.updateHeadlines {
            self.update()
        }
    }
    
    private func fetchGames() {
        
        self.viewModel.updateGame {
            self.update()
        }
    }
    
    func update() {
        
        let tableViewDatasource = MenuModel.MenuTableViewDataSource.init(dataModel: self.viewModel.dataModel)
        self.contentView.update(dataSource: tableViewDatasource)
    }
}
