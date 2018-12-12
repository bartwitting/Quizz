//
//  ScoreController.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import Foundation

class ScoreController {
    
    static let shared = ScoreController()
    
    let baseURL = URL(string: "https://ide50-bartw263.cs50.io:8080/")!
    
    func submitScore(userName : String, highScore : Int, difficulty : String) {
        let initialURL = baseURL.appendingPathComponent("\(difficulty)")
        var request = URLRequest(url: initialURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let postString = "userName=\(userName)&highScore=\(highScore)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard let data = data, error == nil else {
                print("error")
                return
            }
        }
        task.resume()
    }
    
    func fetchScores(difficulty : String, completion: @escaping ([Score]?) -> Void) {
        let scoresURL = baseURL.appendingPathComponent(difficulty)
        let task = URLSession.shared.dataTask(with: scoresURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do {
                if let data = data {
                    let scores = try jsonDecoder.decode([Score].self, from: data)
                    completion(scores)
                }
                else {
                    completion(nil)
                    print(difficulty, "probleem met scores")
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
