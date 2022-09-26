//
//  QuizManager.swift
//  App_SwiftQuiz
//
//  Created by Leticia Speda on 13/09/22.
//

import UIKit

final class QuizManager {
    
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
        (question: "Quais desses é string?", correctAnswer: "\"Olá mundo\"",
         options: ["20", "\"Olá mundo\"", "Olá mundo", "'Olá mundo'"]),
        (question: "Qual é o resultado da expressão \"1\" + \"1\"", correctAnswer: "\"11\"",
         options: ["11", "\"2\"", "\"11\"", "\"1 1\""]),
        (question: "Qual desses símbolos é usado para \"escapar\" caracteres especiais", correctAnswer: "\\",
         options: ["/", "\\", "!", "ESC"]),
        (question: "Qual a sintaxe correta para declarar uma função?", correctAnswer: "func myFunction() {}",
         options: ["func = myFunction() {}", "let myFunction = func() {}", "let func = myFunction() {}", "func myFunction() {}"]),
        (question:
                """
                   func printSomething() {
                      print("Adoro funções")
                   }
                   printSomething()
                """, correctAnswer: "Adoro funções",
         options: ["Nada", "printSomething()", "Adoro funções", "Erro"]),
        (question: "Quando não declaramos o tipo de retorno de uma função, qual é o retorno padrão?", correctAnswer: "Void",
         options: ["Void", "Int", "String", "nil"]),
        (question: "Qual é a sintaxe correta para declarar um parâmetro?", correctAnswer: "resposta correta",
         options: ["func myFunc(String message) {}", "func myFunc(let message = String) {}", "func myFunc(message String) {}", "func myFunc(message: String) {}"]),
        
        (question: "Qual é o tipo de uma variavél String que pode aceitar nil?", correctAnswer: "String?",
         options: ["String", "String?", "Int", "Void"]),
        (question: "Quando queremos declarar uma constante, qual palavra reservada devemos usar?", correctAnswer: "let",
         options: ["var", "const", "let", "CONST"]),
        (question: "O que é um dicionário?", correctAnswer: "É uma coleção não-ordenada com chave e valor",
         options: ["É uma coleção que não aceita objetos repetidos", "É uma coleção ordenada com chave e valor", "É uma coleção não-ordenada com chave e valor", "É uma coleção que permite valores de tipos diferentes"]),
        (question: "Qual o nome do tipo especial em Swift que é usado para declarar blocos ou funções anônimas?", correctAnswer: "Closure",
         options: ["Lambda", "Block", "Closure", "Protocol"]),
        (question: "O que é um enum?", correctAnswer: "Tipo definido pelo usuário para um grupo de valores relacionados",
         options: ["É um conjunto de Strings", "É um tipo especial de String", "É um operador unário do tipo prefix", "Tipo definido pelo usuário para um grupo de valores relacionados"]),
        (question: "O que uma extension não pode fazer?", correctAnswer: "Adicionar propriedades armazenadas",
         options: ["Adicionar novas funcionalidades", "Definir novos construtores", "Adicionar propriedades armazenadas", "Adicionar propriedades computadas"]),
        (question: "Quando herdamos de uma classe e queremos chamar o seu construtor, usamos...", correctAnswer: "super.init",
         options: ["main.init", "super.init", "self.init", "super"]),
    ]
    
    private(set) var quiz: Quiz?
    private(set) var _totalAnswers = 0
    private(set) var _totalCorrectAnswers = 0

    var question: String {
        return quiz?.question ?? ""
    }
    
    var options: [String] {
        return quiz?.options ?? []
    }
    
    var totalAnswers: Int {
        return _totalAnswers
    }
    
    var totalCorrectAnswers: Int {
        return _totalCorrectAnswers
    }
    
    func refreshQuiz() {
        let randowIndex = Int(arc4random_uniform(UInt32(quizes.count)))
        let quizData = quizes[randowIndex]
        quiz = Quiz(question: quizData.question, options: quizData.options, correctAnswer: quizData.correctAnswer)
    }
    
    func validadeAnswers(index: Int) {
        _totalAnswers += 1
        if quiz?.validadeOption(index) == true {
            _totalCorrectAnswers += 1
        }
    }
}
