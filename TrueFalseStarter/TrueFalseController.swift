//
//  TrueFalseController.swift
//  TrueFalseStarter
//
//  Created by Tanveer Momin on 11/13/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import GameKit
import AudioToolbox
import UIKit

public class TrueFalseController {
    
    let trivia = TriviaQuestions()
    var gameSound: SystemSoundID = 0
    var correctSound: SystemSoundID = 0
    var incorrectSound: SystemSoundID = 0
    var questionsBankIndex = [Int]()
    var indexOfSelectedQuestion: Int = 0
    var indexValue = 0
    
    func getRandomTrivia() -> [String: String] {
        var randomNumber = 0
        if questionsBankIndex.count == 0 {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.questions.count)
        } else {
            for index in questionsBankIndex {
                if (randomNumber == index) {
                    randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.questions.count)
                }
            }
        }
        indexValue = randomNumber
        questionsBankIndex.append(randomNumber)
        return(trivia.questions[randomNumber])
    }
    
    func getTriviaAnswer() -> [String: String] {
        return(trivia.questions[indexValue])
    }
    
// functions to load game sounds
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func loadCorrectSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "you-got-it-2", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctSound)
    }
    
    func loadIncorrectSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "no-4", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &incorrectSound)
    }
    
// functions to play game sounds
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playCorrectSound() {
        AudioServicesPlaySystemSound(correctSound)
    }
    
    func playIncorrectSound() {
        AudioServicesPlaySystemSound(incorrectSound)
    }
}
