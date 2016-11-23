//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let trueFalseController = TrueFalseController()
    var questionsAsked = 0
    let questionsPerRound = 4
    var correctQuestions = 0
    var questionsBank = [String]()
    var checkDupe = false
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        trueFalseController.loadGameStartSound()
        trueFalseController.loadCorrectSound()
        trueFalseController.loadIncorrectSound()
        // Start game
        trueFalseController.playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        let triviaQuestion = trueFalseController.getRandomTrivia()
        questionField.text = triviaQuestion["Question"]
        option1Button.setTitle(triviaQuestion["Option1"], for: .normal)
        option2Button.setTitle(triviaQuestion["Option2"], for: .normal)
        option3Button.setTitle(triviaQuestion["Option3"], for: .normal)
        option4Button.setTitle(triviaQuestion["Option4"], for: .normal)
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        option1Button.isHidden = true
        option2Button.isHidden = true
        option3Button.isHidden = true
        option4Button.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }

    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        // Check if button press is the correct answer
        
        let correctAnswer = trueFalseController.getTriviaAnswer()["Answer"]
        
        if ((sender === option1Button) && "Option1" == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            trueFalseController.playCorrectSound()
            option1Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
        } else if ((sender === option2Button) && "Option2" == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            trueFalseController.playCorrectSound()
            option2Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
        } else if ((sender === option3Button) && "Option3" == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            trueFalseController.playCorrectSound()
            option3Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
        } else if ((sender === option4Button) && "Option4" == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            trueFalseController.playCorrectSound()
            option4Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
        } else {
            questionField.text = "Sorry, wrong answer!"
            trueFalseController.playIncorrectSound()
            switch correctAnswer! {
            case "Option1":
                option1Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
            case "Option2":
                option2Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
            case "Option3":
                option3Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
            case "Option4":
                option4Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
            default:
                break
            }
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    
    
    @IBAction func playAgain() {
        // Show the answer buttons
        option1Button.isHidden = false
        option2Button.isHidden = false
        option3Button.isHidden = false
        option4Button.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        questionsBank.removeAll()
        checkDupe = false
        nextRound()
    }
    
    // MARK: Helper Methods
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.option1Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 255.0, alpha: 1.0)
            self.option2Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 255.0, alpha: 1.0)
            self.option3Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 255.0, alpha: 1.0)
            self.option4Button.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 255.0, alpha: 1.0)
            self.checkDupe = false
            self.nextRound()
        }
    }
    
}

