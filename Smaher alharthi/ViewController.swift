//
//  ViewController.swift
//  Smaher alharthi
//
//  Created by smaher on 05/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

   
    //instead of using different views I used stack view for each view start, play and restart
    @IBOutlet weak var startView: UIStackView!
    @IBOutlet weak var playView: UIStackView!
    @IBOutlet weak var restartView: UIStackView!
    
    @IBOutlet weak var timerLabel: UILabel!
    //for word label
    @IBOutlet weak var wordLabel: UILabel!
    //for counting scores
    @IBOutlet weak var scoreLabel: UILabel!
     
    @IBOutlet weak var correctWords: UILabel!
    
    
    var game = Game()
    
    var seconds = 60
    var myTimer: Timer?
    
    deinit {
           // ViewController going away.  Kill the timer.
           myTimer?.invalidate()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startView.isHidden = false
        playView.isHidden = true
        restartView.isHidden = true
        
        
    }

   
    func gameOver(){
        
        startView.isHidden = true
        playView.isHidden = true
        restartView.isHidden = false
        
        correctWords.text = ""
        for guess in game.correctGuess{
            if let text = correctWords.text {
                 correctWords.text = text + "\(guess) \n"
            }

        }
        
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        
        //when clicking strt button hide the start view and start the game
        startView.isHidden = true
        playView.isHidden = false
        restartView.isHidden = true
        startTimer()
        wordLabel.text = game.getRandomWord()
    }
    
    func startTimer(){
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                   self?.seconds -= 1
                   if self?.seconds == 0 {
                       self?.gameOver()
                       timer.invalidate()
                   } else if let seconds = self?.seconds {
                       self!.timerLabel.text = String(format:"%02i:%02i", 0, seconds)
                       
                   }
               }
           }
    
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        game = Game()
        scoreLabel.text = "Score: \(game.score)"
        
        startView.isHidden = true
        playView.isHidden = false
        restartView.isHidden = true
        
        
    }
    
    @IBAction func skipWord(_ sender: UIButton) {
        if game.totalGuess < 12{
        game.allGuesses.append(wordLabel.text!)
        wordLabel.text = game.getRandomWord()
            game.totalGuess += 1}else{
                gameOver()
            }
    }
    
    @IBAction func displayNewCard(_ sender: UIButton) {
        if game.totalGuess < 12{
        game.correctGuess.append(wordLabel.text!)
        game.allGuesses.append(wordLabel.text!)
        wordLabel.text = game.getRandomWord()
        game.totalGuess += 1
        game.score += 1
        scoreLabel.text = "Score: \(game.score)"
        }else{
            gameOver()
        }
    }
    
    

}

