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
        askQuestion()
    }
    
    
    func askQuestion() {
        // setImage assigns a UIImage to the button
        // for: describes which state of the button should be changed. specify .normal which means "standard state of the button"
        // .normal is a static property of a struct called UIControlState
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // all numeric types Int, Double, CGFloat have a random(in:) method that generates a random number in a range
        correctAnswer = Int.random(in: 0...2) // between 0 and 2 inclusive
        title = countries[correctAnswer].uppercased()
        
    }
    

}

