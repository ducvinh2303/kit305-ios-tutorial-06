//
//  ViewController.swift
//  NumberGuess
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var firstResponseLabel: UILabel!
    @IBOutlet weak var secondResponseLabel: UILabel!
    @IBOutlet weak var btnEnter: UIButton!
    
    //we are not using this for this sample lol
    @IBOutlet var btns: [UIButton]!
    
    // some member variables for the game
    var secretNumber:Int = 0
    var guessCount:Int = 0
    var guessedCorrect:Bool = false
    
    //equiv of onCreate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame();
    }

    @IBAction func enterTapped(_ sender: UIButton)
    {
        /*if guessedCorrect
        {
            return //early return eat your heart out julian
        }*/
        
        //pre condition
        guard guessedCorrect == false else
        {
            print("already guessed")
            return
        }
        
        if let enteredGuess:Int = Int(guessField.text!)
        {
            print("Guess Entered");
            print(enteredGuess);
            
            if enteredGuess > secretNumber
            {
                firstResponseLabel.text = "Too high - try again!"
            }
            else if enteredGuess < secretNumber
            {
                firstResponseLabel.text = "Too low - try again!"
            }
            
            if (enteredGuess == secretNumber)
            {
                firstResponseLabel.text = "That's correct - in \(guessCount) tries!"
                secondResponseLabel.text = "Tap Reset to play again."
                
                //they got it right
                guessedCorrect = true
                guessField.isEnabled = false
                btnEnter.isEnabled = false
            }
            else
            {
                guessCount = guessCount + 1
                tryCountLabel.text = String(guessCount)
            }
        }
        else
        {
            print("No guess entered");
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
        
        let random = arc4random()
        print(random)
        secretNumber = Int(random % 1000)
        print("The secret number is \(secretNumber)")
        guessCount = 1
        guessedCorrect = false
        guessField.isEnabled = true
        btnEnter.isEnabled = true
        
        tryCountLabel.text = String(guessCount)
        firstResponseLabel.text = ""
        secondResponseLabel.text = ""
        guessField.text = ""
    }
    
    
    @IBAction func btnNumberPressed(_ sender: UIButton, forEvent event: UIEvent)
    {
        /*
        if let buttonTitle = sender.currentTitle
        {
            print(buttonTitle)
        }
        */
        
        guard let buttonTitle = sender.currentTitle else
        {
            //cannot access buttonTitle in here
            //print(buttonTitle)
            print("you found a button with no title pls report to lindsay ive never seen it b4")
            return
        }
        
        //this code is protected from idiot input
        print(buttonTitle)
        
        //we could check which button by making an IBOutlet
        //if sender == btnsOne
        //if sender == btns[0]
        
        //lets get an int from the title
        guard let guessedNumber = Int(buttonTitle) else
        {
            print("that was not an integer houston the title was \(buttonTitle)")
            return
        }
        
        //now we can use our guess
        print(guessedNumber)
        
    }
    
    @available(iOS 13.0, *)
    @IBAction func menuAction(_ sender: UICommand) 
    {
        print(sender.title)
    }
}

