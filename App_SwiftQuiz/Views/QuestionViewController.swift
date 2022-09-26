//
//  FirstViewController.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 12/09/22.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    //MARK: Components
    let quizManager = QuizManager()
    
    private lazy var loadTime: loadTime = .init(color: #colorLiteral(red: 0.8511558771, green: 0.0146553712, blue: 0.004988920875, alpha: 1), titleTime: Constants.QuestionView.timeLabel.rawValue, titleTimeColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
    
    private lazy var selectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var btnAnswers: [UIButton] = []
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.numberOfLines = 7
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func handleButton(_ sender: UIButton) {
        if let index = btnAnswers.firstIndex(of: sender) {
            quizManager.validadeAnswers(index: index)
        }
        
        getNewQuiz()
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        commonInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTime.performTimer(view.frame.size.width)
        getNewQuiz()
        UIView.animate(withDuration: 20) {
            self.loadTime.performTimer()
        } completion: { isComplete in
            guard isComplete else { return }
            self.showResults()
        }
    }
    
    private func makeButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        button.backgroundColor = .white
        button.titleLabel?.numberOfLines = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }
    
    private func getNewQuiz() {
        quizManager.refreshQuiz()
        questionLabel.text = quizManager.question
        
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btnAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    private func showResults() {
        let controller = ResultViewController()
        controller.totalAnwers = quizManager.totalAnswers
        controller.totalCorrectAnswers = quizManager.totalCorrectAnswers
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    //MARK: Helpers
    private func commonInit() {
        btnAnswers = [
            makeButton(title: "Title01"),
            makeButton(title: "Title02"),
            makeButton(title: "Title03"),
            makeButton(title: "Title04")
        ]
        
        configureHierarchy()
        configureConstrainst()
    }
    
    private func configureHierarchy() {
        selectionView.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(btnAnswers[0])
        mainVStack.addArrangedSubview(btnAnswers[1])
        mainVStack.addArrangedSubview(btnAnswers[2])
        mainVStack.addArrangedSubview(btnAnswers[3])
        
        view.addSubview(selectionView)
        view.addSubview(loadTime)
        view.addSubview(questionLabel)
    }
    
    private func configureConstrainst() {
        NSLayoutConstraint.activate([
            loadTime.topAnchor.constraint(equalTo: view.topAnchor,constant: 70),
            loadTime.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadTime.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadTime.heightAnchor.constraint(equalToConstant: 50),
            
            questionLabel.topAnchor.constraint(
                equalTo: loadTime.bottomAnchor, constant: 10
            ),
            questionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 10
            ),
            questionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -10
            ),
            questionLabel.bottomAnchor.constraint(
                equalTo: selectionView.topAnchor, constant: -10
            ),
            
            selectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
            selectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainVStack.topAnchor.constraint(
                equalTo: selectionView.topAnchor, constant: 10
            ),
            mainVStack.leadingAnchor.constraint(
                equalTo: selectionView.leadingAnchor, constant: 10
            ),
            mainVStack.trailingAnchor.constraint(
                equalTo: selectionView.trailingAnchor, constant: -10
            ),
            mainVStack.bottomAnchor.constraint(
                equalTo: selectionView.bottomAnchor, constant: -10
            ),
            
            btnAnswers[0].heightAnchor.constraint(equalToConstant: 50),
            btnAnswers[1].heightAnchor.constraint(equalToConstant: 50),
            btnAnswers[2].heightAnchor.constraint(equalToConstant: 50),
            btnAnswers[3].heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
