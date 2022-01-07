//
//  Question.swift
//  WhoBilly
//
//  Created by Aleksander Pankow on 02/01/2022.
//

import Foundation

struct ResponseObject: Codable {
    var questions: [Question]
}

struct Question: Codable{
    
    var questionText: String
    var correctAnswer: Int
    var answerList: Answer

        struct Answer: Codable {
            var answerOne: String
            var answerTwo: String
            var answerThree: String
            var answerFour: String
        }
    
}

