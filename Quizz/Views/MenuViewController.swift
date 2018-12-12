//
//  MenuViewController.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var startBut: UIButton!
    @IBOutlet weak var easyBut: UIButton!
    @IBOutlet weak var mediumBut: UIButton!
    @IBOutlet weak var hardBut: UIButton!
    
    var baseUrl = ""
    var difficulty : String = ""
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButs()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startPressed(_ sender: Any) {
        hideButs()
    }
    
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
    
    func hideButs() {
        easyBut.isHidden = !easyBut.isHidden
        mediumBut.isHidden = !mediumBut.isHidden
        hardBut.isHidden = !hardBut.isHidden
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaySegue" {
            let gameVC = segue.destination as! GameViewController
            gameVC.baseUrl = baseUrl
            gameVC.diff = difficulty
        }
    }
}

