//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Tanveer Momin on 11/4/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

var indexValue = 0

struct TriviaQuestions {
    let trivia: [[String : String]] = [
        ["Question": "This was the only US President to serve more than two consecutive terms.",
         "Option1": "George Washington",
         "Option2": "Franklin D. Roosevelt",
         "Option3": "Woodrow Wilson",
         "Option4": "Andrew Jackson",
         "Answer": "Option2"],
        ["Question": "Which of the following countries has the most residents?",
         "Option1": "Nigeria",
         "Option2": "Russia",
         "Option3": "Iran",
         "Option4": "Vietnam",
         "Answer": "Option1"],
        ["Question": "In what year was the United Nations founded?",
         "Option1": "1918",
         "Option2": "1919",
         "Option3": "1945",
         "Option4": "1954",
         "Answer": "Option3"],
        ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
         "Option1": "Paris",
         "Option2": "Washington D.C.",
         "Option3": "New York City",
         "Option4": "Boston",
         "Answer": "Option3"],
        ["Question": "Which nation produces the most oil?",
         "Option1": "Iran",
         "Option2": "Iraq",
         "Option3": "Brazil",
         "Option4": "Canada",
         "Answer": "Option4"],
        ["Question": "Which country has most recently won consecutive World Cups in Soccer?",
         "Option1": "Italy",
         "Option2": "Brazil",
         "Option3": "Argetina",
         "Option4": "Spain",
         "Answer": "Option2"],
        ["Question": "Which of the following rivers is longest?",
         "Option1": "Yangtze",
         "Option2": "Mississippi",
         "Option3": "Congo",
         "Option4": "Mekong",
         "Answer": "Option2"],
        ["Question": "Which city is the oldest?",
         "Option1": "Mexico City",
         "Option2": "Cape Town",
         "Option3": "San Juan",
         "Option4": "Sydney",
         "Answer": "Option1"],
        ["Question": "Which country was the first to allow women to vote in national elections?",
         "Option1": "Poland",
         "Option2": "United States",
         "Option3": "Sweden",
         "Option4": "Senegal",
         "Answer": "Option1"],
        ["Question": "Which of these countries won the most medals in the 2012 Summer Games?",
         "Option1": "France",
         "Option2": "Germany",
         "Option3": "Japan",
         "Option4": "Great Britian",
         "Answer": "Option4"]
    ]
    
    func getRandomTrivia() -> [String: String] {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        indexValue = randomNumber
        return(trivia[randomNumber])
    }
    
    func getTriviaAnswer() -> [String: String] {
        return(trivia[indexValue])
    }
}
