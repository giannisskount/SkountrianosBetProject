//
//  BetNavigationBarView.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit

class BetNavigationBarView: UIView {
    
    lazy var profileButton: UIButton = {
        
        let profileButton = UIButton.init()
        
        let profileIcon = UIImage.init(named: "profile_icon")
        profileIcon?.withRenderingMode(.alwaysTemplate)
        
        profileButton.setImage(profileIcon, for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.tintColor = .white
        
        return profileButton
    }()
    
    lazy var settingsButton: UIButton = {
        
        let settingsButton = UIButton.init()
        
        let settingsIcon = UIImage.init(named: "settings_icon")
        settingsIcon?.withRenderingMode(.alwaysTemplate)
        
        settingsButton.setImage(settingsIcon, for: .normal)
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.tintColor = .white
        
        return settingsButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 9, green: 150, blue: 160)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [profileButton, settingsButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profileButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 25),
            profileButton.heightAnchor.constraint(equalToConstant: 25),
            
            settingsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            settingsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 25),
            settingsButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
