//
//  ViewController.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 12/09/22.
//

import UIKit

final class HomeScreenViewController: UIViewController {
    
    
    //MARK: Components
    private lazy var homeImage: UIImageView = {
        let image = UIImage(named: Constants.HomeScreen.imageLauchescreen.rawValue)
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    private lazy var starButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.HomeScreen.buttonHome.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45, weight: .semibold)
        button.addTarget(self, action: #selector(handle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    @objc func handle() {
        let controller = QuestionViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    //MARK: Helper
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        view.addSubview(homeImage)
        homeImage.addSubview(starButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            homeImage.topAnchor.constraint(equalTo: view.topAnchor),
            homeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            starButton.leadingAnchor.constraint(equalTo: homeImage.leadingAnchor),
            starButton.trailingAnchor.constraint(equalTo: homeImage.trailingAnchor),
            starButton.bottomAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: -100),
            starButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
}

