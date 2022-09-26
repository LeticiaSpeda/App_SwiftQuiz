//
//  Quiz.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 13/09/22.
//

import UIKit

final class Quiz {
    
    let question: String
    let options: [String]
    private let correctAnswer: String
    
    
    init(question: String, options: [String], correctAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
    func validadeOption(_ index: Int) -> Bool {
        let answer = options[index]
        
        return answer == correctAnswer
    }
}
