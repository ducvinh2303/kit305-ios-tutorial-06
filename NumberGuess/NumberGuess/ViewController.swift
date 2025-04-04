//
//  ViewController.swift
//  NumberGuess
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var firstResponseLabel: UILabel!
    @IBOutlet weak var secondResponseLabel: UILabel!

    // some member variables for the game
    var secretNumber: Int = 0
    var guessCount: Int = 0
    var gameWon: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func enterTapped(_ sender: UIButton)
    {
        if gameWon { return }
        
        if let enteredGuess: Int = Int(guessField.text!)
        {
            print("Guess Entered")
            print(enteredGuess)
            
            if enteredGuess > secretNumber
            {
                firstResponseLabel.text = "Way too high! Guess lower."
            }
            else if enteredGuess < secretNumber
            {
                firstResponseLabel.text = "Too low! Aim higher."
            }
            
            if (enteredGuess == secretNumber)
            {
                let alert = UIAlertController(
                    title: "Correct!",
                    message: "You guessed in \(guessCount) tries!",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(
                    title: "Cool!",
                    style: UIAlertActionStyle.cancel,
                    handler: nil
                ))
                self.present(alert, animated: true, completion: nil)
                gameWon = true
            }
            else
            {
                guessCount = guessCount + 1
                tryCountLabel.text = String(guessCount)
            }
        }
        else
        {
            print("No guess entered")
        }
        
        guessField.text = ""
    }
    
    @IBAction func resetTapped(_ sender: UIButton)
    {
        resetGame()
    }
    
    func resetGame()
    {
        print("The game has been reset...")
        
        secretNumber = Int(arc4random() % 1000)
        print("The secret number is \(secretNumber)")
        guessCount = 1
        gameWon = false
        
        tryCountLabel.text = String(guessCount)
        firstResponseLabel.text = ""
        secondResponseLabel.text = ""
        guessField.text = ""
    }
}

