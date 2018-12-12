//
//  QuestionData.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import Foundation

struct Question : Codable {
    var category : String
    var question : String
    var goodAns : String
    var wrongAns : [String]
    
    enum CodingKeys : String, CodingKey {
        case category
        case question
        case goodAns = "correct_answer"
        case wrongAns = "incorrect_answers"
    }
}

struct Questions : Codable {
    var questions : [Question]
    
    enum CodingKeys : String, CodingKey {
        case questions = "results"
    }
}
