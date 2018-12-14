//
//  MenuViewController.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    /// Defining the outlets
    @IBOutlet weak var startBut: UIButton!
    @IBOutlet weak var easyBut: UIButton!
    @IBOutlet weak var mediumBut: UIButton!
    @IBOutlet weak var hardBut: UIButton!
    
    /// Defining the variables
    var baseUrl = ""
    var difficulty : String = ""
    
    /// The unwind function from other VC's to return "home"
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    }
    
    /// Building the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButs()
    }

    /// Action when Start button is pressed
    @IBAction func startPressed(_ sender: Any) {
        hideButs()
        startBut.isEnabled = false
    }
    
    /// Action when one of the difficulty buttons is pressed
    @IBAction func difButPressed(_ sender: UIButton) {
        switch sender {
        case easyBut:
            baseUrl = "https://opentdb.com/api.php?amount=10&category=11&difficulty=easy&type=multiple"
            difficulty = "easy"
        case mediumBut:
            baseUrl = "https://opentdb.com/api.php?amount=10&category=11&difficulty=medium&type=multiple"
            difficulty = "medium"
        case hardBut:
            baseUrl = "https://opentdb.com/api.php?amount=10&category=11&difficulty=hard&type=multiple"
            difficulty = "hard"
        default:
            break
        }
        
        performSegue(withIdentifier: "PlaySegue", sender: nil)
    }
    
    /// Function to hide the difficulty buttons
    func hideButs() {
        easyBut.isHidden = !easyBut.isHidden
        mediumBut.isHidden = !mediumBut.isHidden
        hardBut.isHidden = !hardBut.isHidden
    }
    
    /// Function to send the url and difficulty to the next VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaySegue" {
            let gameVC = segue.destination as! GameViewController
            gameVC.baseUrl = baseUrl
            gameVC.diff = difficulty
        }
    }
}

