//
//  ScoreViewController.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var submitBut: UIButton!
    @IBOutlet weak var highScoreText: UITextView!
    
    var punten : Int!
    var diff : String!
    var highscores : [Score] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(punten!)/10"
        fillUI(diff: diff)
        
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        let text = nameField.text ?? ""
        if text.isEmpty {
            let empty = UIAlertController(title: "Empty Name", message: "You forgot to enter your name", preferredStyle: .alert)
            empty.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(empty, animated: true, completion: nil)
        }
        else {
            ScoreController.shared.submitScore(userName: nameField.text!, highScore: punten, difficulty: diff)
            fillUI(diff: diff)
            submitBut.isEnabled = false
            nameField.endEditing(true)
            nameField.isEnabled = false
        }
    }
    
    func fillUI(diff : String) {
        ScoreController.shared.fetchScores(difficulty: diff) { (highscores) in
            if let highscores = highscores {
                self.updateUI(with: highscores, diff: diff)
            }
        }
    }
    
    func updateUI(with q : [Score], diff : String) {
        DispatchQueue.main.async {
            self.highscores = q
            if self.highscores.count == 0 {
                self.highScoreText.text = "No Highscores recorded yet."
            }
            else {
                self.buildUI(diff: diff)
            }
        }
    }
    
    func buildUI(diff : String) {
        let highScores = highscores.sorted(by: >)
        var verhaal = """
        Highscores with difficulty \(diff): \n
        
        """
        for i in 0..<highScores.count {
            let dex = i + 1
            verhaal += """
            \(dex). \(highscores[i]) \n
            """
        }
        highScoreText.text = verhaal
    }
}



/*
*/
