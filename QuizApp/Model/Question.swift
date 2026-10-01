//
//  Question.swift
//  QuizApp
//
//  Created by ROSZHAN RAJ on 24/09/25.
//

import Foundation

struct Question{
    let text: String
    let answer: String
    
    init(q: String, a: String){
        self.text = q
        self.answer = a
    }
}
