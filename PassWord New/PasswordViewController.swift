//
//  PasswordViewController.swift
//  PassWord New
//
//  Created by Andrew Mogg on 9/13/15.
//  Copyright (c) 2015 Andrew Mogg. All rights reserved.
//

import UIKit
import Foundation

class PasswordViewController: UIViewController {

    @IBOutlet var letterLabel: UILabel!
    @IBAction func lettersChanged(sender: UISlider) {
        let sliderIntValue = Int(sender.value + 0.5)    // Conversion from Float to Integer
        
        /*
        Slider's integer value is converted into a String value.
        The String value is assigned to be the slider's label text.
        */
        
        letterLabel.text = String(sliderIntValue)
    }
    
    
    @IBOutlet var numbersLabel: UILabel!
    @IBAction func numbersChanged(sender: UISlider) {
        let sliderIntValue = Int(sender.value + 0.5)    // Conversion from Float to Integer
        
        /*
        Slider's integer value is converted into a String value.
        The String value is assigned to be the slider's label text.
        */
        
        numbersLabel.text = String(sliderIntValue)
    }
    
    
    @IBOutlet var specialCharactersLabel: UILabel!
    @IBAction func specialCharactersChanged(sender: UISlider) {
        let sliderIntValue = Int(sender.value + 0.5)    // Conversion from Float to Integer
        
        /*
        Slider's integer value is converted into a String value.
        The String value is assigned to be the slider's label text.
        */
        
        specialCharactersLabel.text = String(sliderIntValue)
    }
    
    @IBOutlet var passwordBox: UILabel!
    @IBOutlet var oldPasswordBox: UITextView!
    @IBAction func generateButtonTouched(sender: UIButton) {
        
        //Define letters, numbers and special characters
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let specialCharacters = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"]
        
        
        //Grab the current value from the sliders and create an empty string to write on
        let numberOfLetters: Int! = Int(letterLabel.text!)
        var randomLetters: String = ""
        
        let numberOfNumbers: Int! = Int(numbersLabel.text!)
        var randomNumbers: String = ""
        
        let numberOfSpecialCharacters: Int! = Int(specialCharactersLabel.text!)
        var randomSpecialCharacters: String = ""
        
        var password: Int! = 0
        
        //Use three separate arrays to randomize the characters
        //Generate random letters based on the amount of letters from the slider
        for var i = 0; i < numberOfLetters; i++ {
            let length: UInt32! = UInt32(letters.count)
            password = Int(arc4random_uniform(length))
            
            randomLetters += letters[password]
        }
        
        //Generate random letters based on the amount of numbers from the slider
        for var i = 0; i < numberOfNumbers; i++ {
            let length: UInt32! = UInt32(numbers.count)
            password = Int(arc4random_uniform(length))
            
            randomNumbers += numbers[password]
        }
        
        //Generate random letters based on the amount of special Characters from the slider
        for var i = 0; i < numberOfSpecialCharacters; i++ {
            let length: UInt32! = UInt32(specialCharacters.count)
            password = Int(arc4random_uniform(length))
            
            randomSpecialCharacters += specialCharacters[password]
        }
        
        //Append the random characters together
        let temporaryPassword: String = randomLetters + randomNumbers + randomSpecialCharacters
        
        //Randomize the temporary Password
        var charactersArray = Array(temporaryPassword.characters)
        charactersArray.shuffle()
        let shuffledPassword = String(charactersArray)
        
        //print password to message box
        passwordBox.text = shuffledPassword
        
        //Generate textview box
        var textViewBox = UITextView()
        oldPasswordBox.text = shuffledPassword + "\n" + oldPasswordBox.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//Helper to shuffle password
extension Array {
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}
