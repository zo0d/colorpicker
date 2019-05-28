//
//  ViewController.swift
//  colorpicker
//
//  Created by BJ on 2019-05-27.
//  Copyright © 2019 BJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var first: UIButton!
    @IBOutlet var second: UIButton!
    @IBOutlet var third: UIButton!
    
    @IBOutlet var hintLabel: UILabel!
    
    var colorStrings = ["Black", "Gray", "White", "Purple", "Blue", "Cyan", "Green", "Yellow", "Orange", "Red", "Magenta"]
    var colors: [UIColor] = [.black, .gray, .white, .purple, .blue, .cyan, .green, .yellow, .orange, .red, .magenta]
    var score = 0
    var correct: UIButton?
    
    var rand: Int {
        get {
            return Int.random(in: 0..<colorStrings.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = (UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextQuestion)))
        
        nextQuestion()
    }

    @objc func nextQuestion() {
        let answerIndex = rand
        var strings = colorStrings
        let answer = strings.remove(at: answerIndex)
        
        hintLabel?.text = colorStrings[rand]
        hintLabel?.textColor = colors[answerIndex]
        hintLabel?.backgroundColor = colors[rand]
        
        let buttons = [first, second, third]
        
        correct = buttons.randomElement()!
        
        correct?.setTitle(answer, for: .normal)
        correct?.setTitleColor(colors[rand], for: .normal)
        
        for button in buttons {
            if button != correct {
                button?.setTitle(strings[Int.random(in: 0..<strings.count)], for: .normal)
                button?.setTitleColor(colors[rand], for: .normal)
            }
        }
    }
}

