//
//  ViewController.swift
//  Project2
//
//  Created by Bai on 20/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]() //type inference
    var correctAnswer = 0
    var score = 0
    var questionNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        countries.append("estonia")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("ireland")
//        countries.append("italy")
//        countries.append("monaco")
//        countries.append("nigeria")
//        countries.append("poland")
//        countries.append("russia")
//        countries.append("spain")
//        countries.append("uk")
//        countries.append("us")
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //Views in iOS are backed by CALayer, a Core Animation data type responsible for managing the way your view looks. CALayer sits beneath all UIViews(which is the parent of UIButton, UITableView, etc) for modifying the appearance of views. One appearance option is borderWidth
        //border will be 1px on non-retina devices, 2px on retina devices, 3px on retina HD devices
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        //CALayer sits at a lower technical level than UIButton and UIColor -> doesn't understand what a UIColor is
        //UIButton same level as UIColor
        //CALayer sets color using CGColor which comes from Apple's Core Graphics framework
        //CALayer same lavel as CGColor
        
        button1.layer.borderColor = UIColor.lightGray.cgColor //convert UIColor to CGColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        //UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        
        countries.shuffle()
        //askQuestion(action: nil)
        askQuestion()
    }
    
    
    func askQuestion(action: UIAlertAction! = nil) {
        // setImage assigns a UIImage to the button
        // for: describes which state of the button should be changed. specify .normal which means "standard state of the button"
        // .normal is a static property of a struct called UIControlState
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // all numeric types Int, Double, CGFloat have a random(in:) method that generates a random number in a range
        correctAnswer = Int.random(in: 0...2) // between 0 and 2 inclusive
        title = countries[correctAnswer].uppercased() + " | CURRENT SCORE: \(score)"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //connected to 3 UIButtons
        //event used for attachment : TouchUpInside
        //@IBOutlet = connect code to storyboard layouts
        //@IBAction = make storyboard layouts trigger code
        //sender: UIButton is the caller of the method
        //set identifier Tag for each button. tags 0,1,2 corresponds to flags 0,1,2
        
        var alertMessage = ""
        questionNumber += 1
        
        //1. check whether answer was correct
        if sender.tag == correctAnswer {
            title = "Correct"
            //2. adjust player's score
            alertMessage = "Correct! Keep it up!" 
            score += 1
            
        } else {
            title = "Wrong"
            alertMessage = "Wrong! That's the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        //3. show message telling score
        
        
        
        if questionNumber == 10 {
            alertMessage = "End of quiz! Your final score is \(score)"
        }
        
        let ac = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion)) // 3 possible styles :.default, .cancel, .destructive
        //handler parameter looks for a closure. must use askQuestion not askQuestion()
            //askQuestion -> "here's the name of the method to run"
            //askQuestion() -> "run the askQuestion() method now, and it will tell you the name of the method to run"
        
        //alert controller has 2 styles:
            //.alert -> pops up a message box over the center of the screen. use to tell users about a situation change
            // .actionSheet -> slides options up from the bottom. use to ask them to choose from a set of options
        
        present(ac, animated: true) //view controller to present and whether to animate the presentation
    }
    
}

