//
//  ViewController.swift
//  BruinTap
//
//  Created by Eugene Lo on 2/10/20.
//  Copyright © 2020 Eugene Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    
    var timer: Timer!
    var time: Double = 10
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tapButton.isEnabled = false
    }

    @IBAction func tappedStartButton(_ sender: Any) {
        score = 0
        time = 10
        
        scoreLabel.text = String(score)
        timeLabel.text = String(format: "%.2f", time)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true)
        
        startButton.isEnabled = false
        tapButton.isEnabled = true
    }
    
    @IBAction func tappedTapButton(_ sender: Any) {
        score += 1
        scoreLabel.text = String(score)
    }
    
    @objc func timerAction() {
        time -= 0.01
        timeLabel.text = String(format: "%.2f", time)
        
        if (time <= 0) {
            timer.invalidate()
            timeLabel.text = "no more time uwu  "
        
            startButton.isEnabled = true
            tapButton.isEnabled = false
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) { }
}

