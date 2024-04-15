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
    
    //added this in the lecture to be able to disable the button (and linked it in the interface builder)
    @IBOutlet weak var btnEnter: UIButton!
    
    //we are not using this for this sample lol
    @IBOutlet var btns: [UIButton]!
    
    // some member variables for the game
    var secretNumber:Int = 0
    var guessCount:Int = 0
    
    //tutorial solution is to add this
    var guessedCorrect:Bool = false
    
    //equiv of onCreate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame();
    }

    @IBAction func enterTapped(_ sender: UIButton)
    {
        //the "normal" way of doing a guard
        /*if guessedCorrect
        {
            return //early return eat your heart out julian
        }*/
        
        //pre condition using a guard
        guard guessedCorrect == false else
        {
            print("already guessed")
            return
        }
        
        if let enteredGuess:Int = Int(guessField.text!)
        {
            //lindsay changed this post-lecture, see below
            checkGuess(enteredGuess)
        }
        else
        {
            print("No guess entered");
        }
        
        guessField.text = ""
    }
    
    //lindsay moved this code post-lecture to re-use it for the button guesses
    func checkGuess(_ enteredGuess : Int)
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
            
            //they got it right, bool logic and ui disables
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
    
    @IBAction func resetTapped(_ sender: UIButton)
    {
        resetGame()
    }
    
    func resetGame()
    {
        print("The game has been reset...")
        
        let random = arc4random()
        print(random)
        //lindsay changed this to random between 0 and 10
        secretNumber = Int(random % 10)
        print("The secret number is \(secretNumber)")
        //yes... sometimes the number is bigger than what our buttons allow lol
        guessCount = 1
        
        //bool logic and ui enables
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
        
        //this code is protected from idiot input (1 guard)
        print("Guess as a String \(buttonTitle)")
        
        //we could check which button by making an IBOutlet
        //if sender == btnsOne
        //if sender == btns[0]
        //or see charlies #lecture-chat example getting the stack view children
        
        //lets get an int from the title
        guard let guessedNumber = Int(buttonTitle) else
        {
            //note we CAN use buttonTitle in here, but not guessed Number
            print("That was not an integer houston. The title was \(buttonTitle)")
            return
        }
        
        //this code is extra protected from idiot input (2 guards)
        //so now we can use our guess
        print("guess as an Int \(guessedNumber)")
        //lindsay added this post-lecture, to complete the example
        checkGuess(guessedNumber)
        
    }
    
    //this is the final part of the live coding, where we listen to the selected wicket outcome
    //Note these had to be linked up to the view controllers "first responder" (see the recording for details)
    @available(iOS 13.0, *)
    @IBAction func menuAction(_ sender: UICommand) 
    {
        print(sender.title)
    }
}

