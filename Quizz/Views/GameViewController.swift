//
//  GameViewController.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit
import HTMLString

class GameViewController: UIViewController {
    
    var baseUrl : String!
    var diff : String!
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var ABut: UIButton!
    @IBOutlet weak var BBut: UIButton!
    @IBOutlet weak var CBut: UIButton!
    @IBOutlet weak var DBut: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var score : Int = 0
    var qIndex : Int = 0
    var ques = [Question]()
    var answers : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionsController.shared.fetchQuestions(link: baseUrl) { (ques) in
            if let ques = ques {
                self.updateUI(with: ques)
            }
        }
    }

    func updateUI(with q : [Question]) {
        DispatchQueue.main.async {
            self.ques = q
            if self.ques.count != 0 {
                self.nextQ()
            }
            else {
                self.QLabel.text = "Something went wrong with the data.. Try again later."
            }
        }
    }
        
    @IBAction func ButPressed(_ sender: UIButton) {
        ansGiven(answer: String(sender.currentTitle!), but: sender)
    }
    
    
    func nextQ() {
        let currentQ = ques[qIndex]
        answers = [currentQ.goodAns] + currentQ.wrongAns
        answers.shuffle()
        QLabel.text = currentQ.question.removingHTMLEntities
        ABut.setTitle(answers[0].removingHTMLEntities, for: .normal)
        BBut.setTitle(answers[1].removingHTMLEntities, for: .normal)
        CBut.setTitle(answers[2].removingHTMLEntities, for: .normal)
        DBut.setTitle(answers[3].removingHTMLEntities, for: .normal)
        
        scoreLabel.text = "Score: \(score)"
        
        let progress = Float(qIndex)/Float(ques.count)
        progressBar.setProgress(progress, animated: true)
    }
    
    func ansGiven(answer: String, but: UIButton) {
        let currentQ = ques[qIndex]
        if answer == currentQ.goodAns {
            score += 1
        }
        qIndex += 1
        if qIndex == ques.count {
            performSegue(withIdentifier: "FinishSegue", sender: nil)
        }
        else {
            nextQ()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FinishSegue" {
            let scoreVC = segue.destination as! ScoreViewController
            scoreVC.punten = score
            scoreVC.diff = diff
        }
    }

}
