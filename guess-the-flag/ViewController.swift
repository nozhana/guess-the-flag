//
//  ViewController.swift
//  guess-the-flag
//
//  Created by Nozhan Amiri on 4/18/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var buttons = [UIButton]()
    
    var countries = [String]()
    var score = 0
    var correctAnswerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [button1, button2, button3]
        
        countries += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
        
//        button1.layer.borderWidth = 4
//        button2.layer.borderWidth = 4
//        button3.layer.borderWidth = 4
//        button1.layer.borderColor = UIColor.lightGray.cgColor
//        button2.layer.borderColor = UIColor.lightGray.cgColor
//        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        for button in buttons {
            button.layer.borderWidth = 4
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        
//        button1.setImage(UIImage(named: choices[0]), for: .normal)
//        button2.setImage(UIImage(named: choices[1]), for: .normal)
//        button3.setImage(UIImage(named: choices[2]), for: .normal)
        
        askQuestion(action: nil)

    }
    
    func askQuestion(action: UIAlertAction!) {
        
        let choices = countries.shuffled()[0...2]
        correctAnswerIndex = Int.random(in: 0...2)
        print(correctAnswerIndex)
        
        print(choices) // MARK: Check correct answers
        
        for (button, choice) in zip(buttons, choices) {
            button.setImage(UIImage(named: choice), for: .normal)
        }
        
        title = "Pick the correct flag for \(choices[correctAnswerIndex].uppercased())"
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswerIndex {
            title = "Correct!"
            score += 1
        } else {
            title = "Incorrect!"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score: \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    

}

