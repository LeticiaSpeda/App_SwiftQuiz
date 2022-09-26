//
//  ProgressTime.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 13/09/22.
//

import UIKit

final class loadTime: UIView {
    
//        var colorFirst: UIColor
    var colorSecond: UIColor
    var titleTime: String
    var titleTimeColor: UIColor
    
   
    
    private lazy var loadBackgroundView: UIView = {
        let view = UIView()
//            view.backgroundColor = colorFirst
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var progressView: UIView = {
        let view = UIView()
        view.backgroundColor = colorSecond
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = titleTime
        label.textColor = titleTimeColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(
//            colorFirst: UIColor,
        colorSecond: UIColor,
        titleTime: String,
        titleTimeColor: UIColor
    ) {
//            self.colorFirst = colorFirst
        self.colorSecond = colorSecond
        self.titleTime = titleTime
        self.titleTimeColor = titleTimeColor
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    private func configureHierarchy() {
//            addSubview(loadBackgroundView)
//            loadBackgroundView.
        addSubview(progressView)
        progressView.addSubview(timeLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 50),
            timeLabel.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 16),
            timeLabel.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 10)
        ])
    }
    
    private func configureStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .gray.withAlphaComponent(0.2)
    }
}


