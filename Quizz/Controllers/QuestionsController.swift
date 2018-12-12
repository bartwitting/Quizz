//
//  QuestionsController.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit

class QuestionsController {
    static let shared = QuestionsController()
    
    func fetchQuestions(link : String, completion: @escaping ([Question]?) -> Void) {
        let baseURL = URL(string: link)!
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let vragen = try? jsonDecoder.decode(Questions.self, from: data) {
                    completion(vragen.questions)
            }
            else {
                completion(nil)
                print("probleem")
            }
        }
        task.resume()
    }
    
    
}
