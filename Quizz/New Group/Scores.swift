//
//  Scores.swift
//  Quizz
//
//  Created by Bart Witting on 10/12/2018.
//  Copyright © 2018 Bart Witting. All rights reserved.
//

import Foundation

struct Score : Codable {
    var userName : String
    var score : String
    
    var highScore : Int {
        return Int(score)!
    }
    
    static func > (lhs : Score, rhs : Score) -> Bool{
        return lhs.highScore > rhs.highScore
    }
}

/*
 "results":[{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"Which of the following is not the name of a &#039;Bond Girl&#039;? ","correct_answer":"Vanessa Kensington","incorrect_answers":["Pam Bouvier","Mary Goodnight","Wai Lin"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"Who directed &quot;E.T. the Extra-Terrestrial&quot; (1982)?","correct_answer":"Steven Spielberg","incorrect_answers":["Stanley Kubrick","James Cameron","Tim Burton"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"Which actress danced the twist with John Travolta in &#039;Pulp Fiction&#039;?","correct_answer":"Uma Thurman","incorrect_answers":["Kathy Griffin","Pam Grier","Bridget Fonda"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"This movie contains the quote, &quot;Houston, we have a problem.&quot;","correct_answer":"Apollo 13","incorrect_answers":["The Right Stuff","Capricorn One","Marooned"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"What was the first James Bond film?","correct_answer":"Dr. No","incorrect_answers":["Goldfinger","From Russia With Love","Thunderball"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"The 2002 film &quot;28 Days Later&quot; is mainly set in which European country?","correct_answer":"United Kingdom","incorrect_answers":["France","Italy","Germany"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"When does &quot;Rogue One: A Star Wars Story&quot; take place chronologically in the series?","correct_answer":"Between Episode 3 and 4","incorrect_answers":["After Episode 6","Before Episode 1","Between Episode 4 and 5"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"At the end of the 2001 film &quot;Rat Race&quot;, whose concert do the contestants crash?","correct_answer":"Smash Mouth","incorrect_answers":["Bowling for Soup","Sum 41","Linkin Park"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"Who plays the character of Po in the Kung Fu Panda movies?","correct_answer":"Jack Black","incorrect_answers":["Mirana Jonnes","McConahey Ramses","Jim Petersson"]},{"category":"Entertainment: Film","type":"multiple","difficulty":"easy","question":"What is the name of the island that &quot;Jurassic Park&quot; is built on?","correct_answer":"Isla Nublar","incorrect_answers":["Isla Sorna","Isla Muerta","Isla Pena"]}]
*/
