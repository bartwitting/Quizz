//
//  FeaturedViewController.swift
//  Quizz
//
//  Created by Bart Witting on 11/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {

    /// Defining outlets
    @IBOutlet weak var segmentBut: UISegmentedControl!
    @IBOutlet weak var highScoreText: UITextView!
    
    /// Defining variables
    var highscores : [Score] = []
    
    /// Building the app
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUI(diff: "easy")
    }
    
    /// Action to process the data picker
    @IBAction func diffPicker(_ sender: AnyObject) {
        switch segmentBut.selectedSegmentIndex {
        case 0:
            fillUI(diff: "easy")
        case 1:
            fillUI(diff: "medium")
        case 2:
            fillUI(diff: "hard")
        default:
            break
        }
    }
    
    /// Function to retrieve data
    func fillUI(diff : String) {
        ScoreController.shared.fetchScores(difficulty: diff) { (highscores) in
            if let highscores = highscores {
                self.updateUI(with: highscores, diff: diff)
            }
        }
    }
    
    /// Function to check if there is data
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
    
    /// Fill the highscore textfield with data
    func buildUI(diff : String) {
        let highScores = highscores.sorted(by: >)
        var verhaal = """
        Highscores with difficulty \(diff): \n
        
        """
        for i in 0..<highScores.count {
            let dex = i + 1
            verhaal += """
            \(dex). \(highScores[i]) \n
            """
        }
        highScoreText.text = verhaal
    }
    
}
