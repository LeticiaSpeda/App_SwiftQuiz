//
//  ProgressTime.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 13/09/22.
//

import UIKit

final class loadTime: UIView {
    
    //MARK: - Components
    var color: UIColor
    var titleTime: String
    var titleTimeColor: UIColor
    
    private lazy var progressView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = titleTime
        label.textColor = titleTimeColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    //MARK: - Construtor
    init(color: UIColor, titleTime: String, titleTimeColor: UIColor) {
        self.color = color
        self.titleTime = titleTime
        self.titleTimeColor = titleTimeColor
        super.init(frame: .zero)
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureHierarchy() {
        addSubview(progressView)
        progressView.addSubview(timeLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            progressView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            progressView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            
            timeLabel.centerYAnchor.constraint(
                equalTo: progressView.centerYAnchor
            ),
            timeLabel.leadingAnchor.constraint(
                equalTo: progressView.leadingAnchor, constant: 10
            ),
        ])
    }
    
    func performTimer(_ size: CGFloat = .zero) {
        progressView.frame.size.width = size
    }
    
    private func configureStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .gray.withAlphaComponent(0.2)
    }
}


