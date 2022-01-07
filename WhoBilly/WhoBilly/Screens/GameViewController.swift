//
//  GameViewController.swift
//  WhoBilly
//
//  Created by Aleksander Pankow on 09/12/2021.
//

import UIKit
import Alamofire

class GameViewController: UIViewController{
    
    var gameRandomNumber = Int.random(in: 0..<5)
    var currentGameQuestions: [Question] = []
    
    //Question Label
    @IBOutlet weak var questionLabel: UILabel!
    
    //Answer Buttons
    @IBAction func answerOneButton(sender: Any) {
    }
    
    //Answer Labels
    @IBOutlet weak var answerFourLabel: UILabel!
    @IBOutlet weak var answerThreeLabel: UILabel!
    @IBOutlet weak var answerTwoLabel: UILabel!
    @IBOutlet weak var answerOneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        currentGameQuestions = GameSession.Start(gameNumber: gameRandomNumber)
        
        self.questionLabel.text = currentGameQuestions[0].questionText
        self.answerOneLabel.text = currentGameQuestions[0].answerList.answerOne
        self.answerTwoLabel.text = currentGameQuestions[0].answerList.answerTwo
        self.answerThreeLabel.text = currentGameQuestions[0].answerList.answerThree
        self.answerFourLabel.text = currentGameQuestions[0].answerList.answerFour
        
        
    }

}
