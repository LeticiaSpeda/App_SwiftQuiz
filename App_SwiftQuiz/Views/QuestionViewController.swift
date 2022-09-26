//
//  FirstViewController.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 12/09/22.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    let quizManager = QuizManager()
    
    //MARK: Components
    private lazy var loadBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.2)
        return view
    }()
    
    private lazy var progressView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8472319841, green: 0.2042682469, blue: 0.003129100427, alpha: 1)
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.QuestionView.timeLabel.rawValue
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
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
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.numberOfLines = 6
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
        progressView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 20) {
            self.progressView.frame.size.width = .zero
        } completion: { [weak self] _ in
            self?.showResults()
        }
        getNewQuiz()
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
        progressView.addSubview(timeLabel)
        loadBackgroundView.addSubview(progressView)
        selectionView.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(btnAnswers[0])
        mainVStack.addArrangedSubview(btnAnswers[1])
        mainVStack.addArrangedSubview(btnAnswers[2])
        mainVStack.addArrangedSubview(btnAnswers[3])
        
        view.addSubview(selectionView)
        view.addSubview(loadBackgroundView)
        
        view.addSubview(questionLabel)
    }
    
    private func configureConstrainst() {
        NSLayoutConstraint.activate([
            loadBackgroundView.topAnchor.constraint(equalTo: view.topAnchor,constant: 70),
            loadBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadBackgroundView.heightAnchor.constraint(equalToConstant: 50),
            
            
            progressView.topAnchor.constraint(equalTo: loadBackgroundView.topAnchor),
            progressView.bottomAnchor.constraint(equalTo: loadBackgroundView.bottomAnchor),
            
            
            
            timeLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 10),
            
            questionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            questionLabel.bottomAnchor.constraint(equalTo: selectionView.topAnchor, constant: -10),
            
            selectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
            selectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainVStack.topAnchor.constraint(equalTo: selectionView.topAnchor, constant: 10),
            mainVStack.leadingAnchor.constraint(equalTo: selectionView.leadingAnchor, constant: 10),
            mainVStack.trailingAnchor.constraint(equalTo: selectionView.trailingAnchor, constant: -10),
            mainVStack.bottomAnchor.constraint(equalTo: selectionView.bottomAnchor, constant: -10),
            
            btnAnswers[0].heightAnchor.constraint(equalToConstant: 50),
            btnAnswers[1].heightAnchor.constraint(equalToConstant: 50),
            btnAnswers[2].heightAnchor.constraint(equalToConstant: 50),
            btnAnswers[3].heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
