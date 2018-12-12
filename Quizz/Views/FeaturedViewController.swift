//
//  FeaturedViewController.swift
//  Quizz
//
//  Created by Bart Witting on 11/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {

    @IBOutlet weak var segmentBut: UISegmentedControl!
    @IBOutlet weak var highScoreText: UITextView!
    
    var highscores : [Score] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUI(diff: "easy")
    }
    
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
        var verhaal = """
        Highscores with difficulty \(diff):
        
        """
        verhaal += """
        \(highscores)
        """
        highScoreText.text = verhaal
    }
    
}
