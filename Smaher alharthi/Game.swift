//
//  Game.swift
//  Smaher alharthi
//
//  Created by smaher on 05/05/1443 AH.
//

import Foundation


class Game{
    
    var listOfWords:[String] = [
        "share",
        "amusement park",
        "watch",
        "delay",
        "asleep",
        "pig",
        "elephant",
        "labybug",
        "bunt",
        "Dear",
        "mud",
        "seashell",
        "Tarantula",
        "cartoon",
        "Strong",
        "coach",
        "guitar",
    ]
    
    var correctGuess:[String] = []
    var allGuesses:[String] = []
    var totalGuess = 0
    
    var score = 0
    
    func getRandomWord()->String{
        
    var random = listOfWords[Int.random(in: 0...16)]
       while allGuesses.contains(random){
           random = listOfWords[Int.random(in: 0...16)]
        }
        return random
    }
    
}
