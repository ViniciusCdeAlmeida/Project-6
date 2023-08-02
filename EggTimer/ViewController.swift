//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft":3,"Medium":7,"Hard":12]
    var secondsRemaning = 60
    var timer = Timer()
    @IBAction func eggBtn(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        secondsRemaning = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaning > 0{
            secondsRemaning -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
}
