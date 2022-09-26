//
//  ResultViewController.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 12/09/22.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var totalAnwers: Int = 1
    var totalCorrectAnswers: Int = 0
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Resultado"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private lazy var resultTotalAnsweredLabel: UILabel = {
        let label = UILabel()
        label.text = "Perguntas respondidas: \(totalAnwers)"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
                    
    private lazy var resultTotalCorrectLabel: UILabel = {
        let label = UILabel()
        label.text = "Perguntas coretas: \(totalCorrectAnswers)"
        label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultTotalWrongLabel: UILabel = {
        let label = UILabel()
        label.text = "Perguntas erradas: \(totalAnwers - totalCorrectAnswers)"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var resultTotal: UILabel = {
        let score = totalCorrectAnswers * 100 / totalAnwers
        let label = UILabel()
        label.text = "\(score)%"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 90, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var restartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reiniciar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.8472319841, green: 0.2042682767, blue: 0.01397921517, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonRestart), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonRestart() {
        let controller = QuestionViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        view.backgroundColor = .white
       
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(.init())
        mainVStack.addArrangedSubview(resultTotalAnsweredLabel)
        mainVStack.addArrangedSubview(resultTotalCorrectLabel)
        mainVStack.addArrangedSubview(resultTotalWrongLabel)
        mainVStack.addArrangedSubview(.init())
        view.addSubview(resultTotal)
        view.addSubview(restartButton)


    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainVStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            mainVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainVStack.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),
            mainVStack.bottomAnchor.constraint(equalTo: resultTotal.topAnchor, constant: -30),
            
            resultTotal.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultTotal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            resultTotal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),

            restartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            restartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            restartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            restartButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}
